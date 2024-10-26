<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class ActivityObjectController extends Controller
{
    public function index($activity_object_id) {
        
        $activity_object = new Blank('activity_object',$activity_object_id);
        $page_title = "Activity Object - " . $activity_object->name;
        $event_activities_results_objects = $activity_object->get_referring_results('event_activities_results_objects');
        $results_values = array();
        $results_values_opponents = array();
        $events = array();
        $users = array();
        $scores = array();
        $scores_opponents = array();
        
        foreach($event_activities_results_objects as $this_event_activities_results_object) {
            $event_activities_results = $this_event_activities_results_object->get_associated_result('event_activities_results');
            $event_activities = $event_activities_results->get_associated_result('event_activities');
            $event = $event_activities->get_associated_result('event');
            $user = new Blank('users',$event_activities_results->users_id);
            $event->event_activities_name = $event_activities->name;
            $event->event_activities_results_result_value = $event_activities_results->result_value;
            $opponents_results = new Blank('event_activities_results');
            $opponents_results = $opponents_results->get_all(limit_by:'event_activities_id = ' . $event_activities->id . ' AND users_id != ' . $event_activities_results->users_id);
            array_push($events,$event);
            array_push($results_values,$event_activities_results->result_value);
            $opponents_results['user_results'] = $event_activities_results;
            array_push($results_values_opponents,$opponents_results);
            
            if(!in_array($user,$users))
                array_push($users,$user);
            if(!isset($scores[$event_activities_results->result_value]))
                $scores[$event_activities_results->result_value] = 1;
            else
                $scores[$event_activities_results->result_value] += 1;
        }
        ksort($scores);
        foreach($results_values_opponents as $these_results) {
            $user_results = $these_results['user_results'];
            unset($these_results['user_results']);
            foreach($these_results as $this_result) {
                $tmp_event_activities_results_obj = $this_result->get_referring_results('event_activities_results_objects')[0];
                $tmp_activity_obj = $tmp_event_activities_results_obj->get_associated_result('activity_object');
                if(!isset($scores_opponents[$tmp_activity_obj->id])) {
                    $scores_opponents[$tmp_activity_obj->id]['title'] = $tmp_activity_obj->get_href();
                    $scores_opponents[$tmp_activity_obj->id][$this_result->result_value] = 1;
                } else {
                    if(!isset($scores_opponents[$tmp_activity_obj->id][$this_result->result_value]))
                        $scores_opponents[$tmp_activity_obj->id][$this_result->result_value] = 1;
                    else
                        $scores_opponents[$tmp_activity_obj->id][$this_result->result_value] += 1;
                }
                if(!isset($scores_opponents[$tmp_activity_obj->id . '_user'][$user_results->result_value])) {
                    $scores_opponents[$tmp_activity_obj->id . '_user'][$user_results->result_value] = 1;
                } else {
                    $scores_opponents[$tmp_activity_obj->id . '_user'][$user_results->result_value] += 1;
                }
                ksort($scores_opponents[$tmp_activity_obj->id]);
                ksort($scores_opponents[$tmp_activity_obj->id . '_user']);
            }  
        }


        foreach($scores_opponents as $key => $these_scores) {
            $total_placement = 0;
            $total_games = 0;
            foreach($these_scores as $key2 => $value) {
                if($key2 == 'title') continue;
                $total_placement = $total_placement + ($key2*$value);
                $total_games += $value;
            }
            $these_scores['average_placement'] = ($total_placement / $total_games);
            $scores_opponents[$key] = $these_scores;
        }

        return view('activity_object',compact("page_title","activity_object","event_activities_results_objects","events","results_values","users","scores","scores_opponents"));
    }
}
