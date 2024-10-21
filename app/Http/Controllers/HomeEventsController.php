<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class HomeEventsController extends Controller
{
    public function index() {
        $page_title = "Home Events";
        $all_events = new Blank('event');
        $all_events = $all_events->get_all(sort_by:"date");

        $all_users = new Blank('users');
        $all_users = $all_users->get_all(sort_by:"name");

        $all_activity_objects = new Blank('activity_object');
        $all_activity_objects = $all_activity_objects->get_all(sort_by:"name");

        return view('index',compact("page_title","all_events","all_users","all_activity_objects"));
    }
}
