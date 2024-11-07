<?php

    use Illuminate\Support\Facades\Cache;
    use Illuminate\Support\Facades\DB;
    use App\Models\Blank;
    require_once(app_path() . '/define.php');

    function get_set_cache($cache_check,$fallback_source,$timeout=6000) {

        if(!Cache::has($cache_check)) {
            $val = eval("return $fallback_source");
            Cache::put($cache_check, $val, $timeout);
            return $val;
        }

        return Cache::get($cache_check);
    }
    
    function date_display($this_date) {
        if(!($this_date instanceof DateTime))
            $this_date = strtotime($this_date);

        return date(DATEDISPLAY,$this_date);
    }

    function remove_from_cache($key_to_check) {
        if(Cache::has($key_to_check))
            Cache::forget($key_to_check);

        return;
    }
    
    function user_has_role($role,$user_id=null) {
        if(!$user_id)
            $user_id = Auth::id();

        if(!$user_id)
            return false;

        $users_roles = new Blank ("users_roles");

        return ($users_roles->get_all(limit_by:"users_id = " . $user_id . " AND roles_id = " . $role)) ? true : false;   

    }
    
    function user_has_group_role($groups_id,$roles_groups_id,$users_id=null) {
        if(!$users_id)
            $users_id = Auth::id();

        if(!$users_id)
            return false;

        $users_groups = new Blank ("users_groups");

        return ($users_groups->get_all(limit_by:"users_id = " . $users_id . " AND roles_groups_id = " . $roles_groups_id . " AND groups_id = " . $groups_id)) ? true : false;   

    }

    function get_all_blank($table_name,$limit_by=null,$sort_by=null) {
        $tmp_obj = new Blank($table_name);
        $tmp_obj = $tmp_obj->get_all(limit_by:$limit_by,sort_by:$sort_by);
            
        return $tmp_obj;
    }
    
    function get_value_by_type_and_id($obj_type,$obj_id,$fields) {
        $tmp_obj = new Blank($obj_type,$obj_id);
        $results = array();
        foreach(explode(",",$fields) as $this_field) {
            $results[$this_field] = $tmp_obj->get_value($this_field);
        }
    
        return $results;
    }

    function get_href_by_type_and_id($obj_type,$obj_id) {
        $tmp_obj = new Blank($obj_type,$obj_id);
        return $tmp_obj->get_href();
    }
?>
