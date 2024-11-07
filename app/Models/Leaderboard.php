<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\Models\Blank;
use DateTime;

class Leaderboard extends Blank {

    // Constructor to create a blank object. Pass in an ID to populate values for the matching id row in the DB
    public function __construct($initial_id = null,$include_associated=false,$include_referrals=false,$sort_by=null) {
            $this->set_value('table_name','leaderboard');
            $this->set_value('id',(int)$initial_id);
            return $this->set_values_by_id((int)$initial_id,$include_associated,$include_referrals,$sort_by);
    }
    
    public function get_leaderboard($date_from=null,$date_to=null) {
        $data['name'] = $this->get_value('name');
        $data['description'] = $this->get_value('description');
        $data['results'] = array();
        $date_from_obj = DateTime::createFromFormat('Y-m-d H:i:s', $date_from);
        $date_to_obj = DateTime::createFromFormat('Y-m-d H:i:s', $date_to);

        $query = DB::table('event_activities_results');
        $query->select('users_id',DB::raw($this->get_value('sql_function') . '(result_value) AS score'));

        $event_limit = array('groups_id = ' . $this->get_value('groups_id'));
        if($date_from_obj && $date_from_obj->format('Y-m-d H:i:s') == $date_from)
            array_push($event_limit,"date >= '" . $date_from . "'");
        if($date_to_obj && $date_to_obj->format('Y-m-d H:i:s') == $date_to)
            array_push($event_limit,"date <= '" . $date_to . "'");
        $event_limit = " AND event_id IN(SELECT id FROM event WHERE " . implode(" AND ",$event_limit) . ")";

        $query->whereRaw('event_activities_id IN(SELECT id FROM event_activities where activity_id = ' . $this->get_value('activity_id') . ' and groups_id = ' . $this->get_value('groups_id') . $event_limit . ')');

        $query->where('groups_id','=',$this->get_value('groups_id'));
        if($this->get_value('target_value'))
            $query->where('result_value','=',$this->get_value('target_value'));
        $query->groupBy('users_id');
        $query->orderByRaw('score ' . $this->get_value('sort_type'));
        if($this->get_value('minimum_results'))
            $query->havingRaw('COUNT(result_value) >= ?',[$this->get_value('minimum_results')]);
        if($this->get_value('total_positions'))
            $query->limit($this->get_value('total_positions'));

        $board_rs = $query->get();
        foreach($board_rs as $this_board_row) {
            array_push($data['results'],array('users_id' => $this_board_row->users_id,'score' => $this_board_row->score));
        }
        
        return $data;
    }
    
    public function show($date_from=null,$date_to=null) {
        
        $leaderboard = $this->get_leaderboard(date_from:$date_from,date_to:$date_to);
        return view('leaderboard',compact("leaderboard"));
    }
}

?>
