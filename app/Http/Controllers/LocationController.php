<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function index($location_id) {
        
        $location = new Blank('location',$location_id);
        $page_title = $location->name;
        $events = new Blank('event');
        $events = $events->get_all(limit_by:'location_id = ' . $location->id);
        
        return view('location',compact("page_title","location","events"));
    }
}
