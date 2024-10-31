<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function index($location_id) {
        
        $location = new Blank('location',$location_id,include_referrals:'event',sort_by:'event.date');
        $page_title = $location->name;
        
        return view('location',compact("page_title","location"));
    }
}
