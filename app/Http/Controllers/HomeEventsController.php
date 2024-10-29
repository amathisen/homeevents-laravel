<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class HomeEventsController extends Controller
{
    public function index() {
        $page_title = "Home Events";
        $all_events = get_all_blank(table_name:'event',sort_by:"date");
        $all_users = get_all_blank(table_name:'users',sort_by:"name");
        $all_activity_objects = get_all_blank(table_name:'activity_object',sort_by:"name");
        
        return view('index',compact("page_title","all_events","all_users","all_activity_objects"));
    }
}
