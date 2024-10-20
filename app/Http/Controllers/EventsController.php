<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class EventsController extends Controller
{
    public function index($event_id) {
        $event = new Blank('event',$event_id);
        $users = $event->get_referring_results_by_link('event_users','users');
        $location = $event->get_associated_result('location');
        $event_activities = $event->get_referring_results('event_activities');
        $activity_block = array();
        $missing_results = array();
        
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
                    array_push($missing_results,array($this_activity->id,$this_user->id));
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

        return view('event',compact("event","users","location","activity_block"));
    }
}
