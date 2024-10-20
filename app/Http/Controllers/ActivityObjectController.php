<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class ActivityObjectController extends Controller
{
    public function index($activity_object_id) {
        
        $activity_object = new Blank('activity_object',$activity_object_id);        
        $event_activities_results_objects = $activity_object->get_referring_results('event_activities_results_objects');
        $results_values = array();
        $events = array();
        
        
        foreach($event_activities_results_objects as $this_event_activities_results_object) {
            $event_activities_results = $this_event_activities_results_object->get_associated_result('event_activities_results');
            $event_activities = $event_activities_results->get_associated_result('event_activities');
            $event = $event_activities->get_associated_result('event');
            $event->event_activities_name = $event_activities->name;
            $event->event_activities_results_result_value = $event_activities_results->result_value;
            array_push($events,$event);
            array_push($results_values,$event_activities_results->result_value);
        }
        
        return view('activity_object',compact("activity_object","event_activities_results_objects","events","results_values"));
    }
}
