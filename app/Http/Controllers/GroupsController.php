<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use App\Models\Leaderboard;
use Illuminate\Http\Request;

class GroupsController extends Controller
{
    public function index($groups_id) {
        $group = new Blank('groups',$groups_id,include_referrals:'users_groups,event',sort_by:'event.date,users_groups.users_id,users_groups.roles_groups_id');
        $page_title = "Group - " . $group->name;
        $event = new Blank('event');

        $leaderboards = new Leaderboard();
        $leaderboards = $leaderboards->get_all(limit_by:'groups_id=' . $group->id);

        return view('groups',compact("page_title","group","leaderboards","event"));
    }
}
