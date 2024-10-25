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

    function user_has_role($role,$user_id=null) {
        if(!$user_id)
            $user_id = Auth::id();

        if(!$user_id)
            return false;

        $users_roles = new Blank ("users_roles");

        return ($users_roles->get_all(limit_by:"users_id = " . $user_id . " AND roles_id = " . $role)) ? true : false;   

    }
?>
