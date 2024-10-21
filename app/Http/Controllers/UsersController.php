<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function index($user_id) {
        $user = new Blank('users',$user_id);
        $page_title = "User - " . $user->name;
        $events = $user->get_referring_results_by_link('event_users','event');
        $results_tracker = array();
        $results_objects_tracker = array();
        $results_block = array();
        
        foreach($events as $this_event) {
            $event_activities = $this_event->get_referring_results('event_activities');
            $this_event->activity_details = array();
            foreach($event_activities as $this_activity) {
                $activity = $this_activity->get_associated_result('activity');
                $result = $this_activity->get_referring_results('event_activities_results',array('users_id',$user->id));
                if(isset($result[0]->result_value)) {
                    $result_value = $result[0]->result_value;
                    $results_object = $result[0]->get_referring_results_by_link('event_activities_results_objects','activity_object');
                    if(isset($results_object[0]->name)) {
                        $results_object_name = $results_object[0]->get_href();
                        if(!isset($results_objects_tracker["activity_object_" . $results_object[0]->id])) {
                            $results_objects_tracker["activity_object_" . $results_object[0]->id] = array();
                            array_push($results_objects_tracker["activity_object_" . $results_object[0]->id],$results_object[0]->get_href());
                            array_push($results_objects_tracker["activity_object_" . $results_object[0]->id],-1);
                        }
                        array_push($results_objects_tracker["activity_object_" . $results_object[0]->id],$result_value);
                    } else
                        $results_object_name = null;
                    if(!isset($results_tracker["activity_" . $activity->id])) {
                        $results_tracker["activity_" . $activity->id] = array();
                        array_push($results_tracker["activity_" . $activity->id],$activity->name);
                        array_push($results_tracker["activity_" . $activity->id],$activity->id);
                    }
                    array_push($results_tracker["activity_" . $activity->id],$result_value);
                } else {
                    $result_value = "--";
                    $results_object_name = null;
                }
                $activity_details = array(
                                        'this_activity_name' => $this_activity->name,
                                        'activity_name' => $activity->name,
                                        'result_value' => $result_value,
                                        'results_object_name' => $results_object_name);
                $this_event->activity_details = array_merge($this_event->activity_details,array($activity_details));
            }
        }

        foreach(array($results_tracker,$results_objects_tracker) as $results) {
            $these_results = array();
            foreach($results as $this_results_set) {
                $this_activity_block = array();
                $this_activity_name = array_shift($this_results_set);
                $this_activity_id = array_shift($this_results_set);
                array_push($this_activity_block,$this_activity_name);
                
                switch($this_activity_id) {
                    case GOFIRSTDICEID:
                    case GOFIRSTDICEREROLLID:
                        array_push($this_activity_block,array("Times rolled",count($this_results_set)));
                        array_push($this_activity_block,array("Average Roll",(array_sum($this_results_set) / count($this_results_set))));
                    break;
                    case MULLIGANID:
                        array_push($this_activity_block,array("Times mulliganed",array_sum($this_results_set)));
                    break;
                    case MTGCOMMANDERID:
                    case ACTIVITYOBJECTID:
                        array_push($this_activity_block,array("Games Played",count($this_results_set)));
                        array_push($this_activity_block,array("Average Placement",(array_sum($this_results_set) / count($this_results_set))));
                    break;
                    default:
                }
                array_push($these_results,$this_activity_block);
            }
            array_push($results_block,$these_results);
        }

        return view('user',compact("page_title","user","events","results_block"));
    }
}
