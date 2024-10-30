<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class EventsController extends Controller
{
    public function index($event_id) {
        $event = new Blank('event',$event_id);
        $page_title = "Event - " . $event->title;
        $users = $event->get_referring_results_by_link('event_users','users');
        $event_activities = $event->get_referring_results('event_activities',sort_by:'name');
        $activity_block = array();
        $missing_results = array();
        $activity_objects = get_all_blank('activity_object',sort_by:'name');
        
        foreach($event_activities as $this_activity) {
            $activity = $this_activity->get_associated_result('activity');
            $this_activity_block = array();
            array_push($this_activity_block,$this_activity->name);
            array_push($this_activity_block,$activity->name);
            
            foreach($users as $this_user) {
                $this_result = $this_activity->get_referring_results('event_activities_results',array('users_id',$this_user->id));
                
                if(isset($this_result[0]))
                    $this_result = $this_result[0];
                if(!isset($this_result->id)) {
                    $this_activity_object_type = $activity->get_referring_results('activity_object_type');
                    $this_missing_result = array("event_activities_id" => $this_activity->id,"users_id" => $this_user->id,"users_name" => $this_user->name,"event_activities_name" => $this_activity->name, "activity_name" => $activity->name, "activity_id" => $activity->id);
                    if(count($this_activity_object_type))
                        $this_missing_result['activity_object_type_id'] = $this_activity_object_type[0]->id;
                    array_push($missing_results,$this_missing_result);
                    continue;
                }
                
                $score_value = isset($this_result->result_value) ? $this_result->result_value : '';
                $display_name = $this_user->get_href();
                $results_object = $this_result->get_referring_results('event_activities_results_objects');
                if(isset($results_object[0]))
                    $results_object = $results_object[0];
                if(isset($results_object->id) && (int)$results_object->id > 0) {
                    $activity_object = new Blank('activity_object',$results_object->activity_object_id);
                    $extra_name = isset($activity_object->name) ? " (" . $activity_object->get_href() . ")": '';
                    $display_name .= $extra_name;
                }
               array_push($this_activity_block,array("display_name" => $display_name,"score_value" => $score_value));
            }
            array_push($activity_block,$this_activity_block);
        }

        $missing_users = new Blank('users');
        $activities = new Blank('activity');
        
        if(user_has_role(ROLEIDS["ADMIN"])) {
            if(count($users))
                $missing_users = $missing_users->get_all(limit_by:"id NOT IN(" . implode(",",array_column($users,'id')) . ")",sort_by:"name");
            else
                $missing_users = $missing_users->get_all();

            $activities = $activities->get_all();
        }
        
        return view('event',compact("page_title","event","users","activity_block","missing_users","activities","missing_results","activity_objects"));
    }
}
