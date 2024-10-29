<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class GroupsController extends Controller
{
    public function index($groups_id) {
        $group = new Blank('groups',$groups_id);
        $page_title = "Group - " . $group->name;

        $users_groups = get_all_blank('users_groups',limit_by:'groups_id = ' . $group->id,sort_by:'users_id,roles_groups_id');
        $events = get_all_blank('event',limit_by:'groups_id = ' . $group->id,sort_by:'date');

        return view('groups',compact("page_title","group","users_groups","events"));
    }
}
