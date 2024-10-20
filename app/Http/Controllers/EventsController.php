<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class EventsController extends Controller
{
    public function index($event_id) {
        $event = new Blank('event',$event_id);
        
        return view('event',compact("event"));
    }
}
