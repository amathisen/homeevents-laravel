<?php

    use Illuminate\Support\Facades\Cache;
    use Illuminate\Support\Facades\DB;
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

?>
