<?php

    use Illuminate\Support\Facades\Cache;
    use Illuminate\Support\Facades\DB;
        
    function get_set_cache($cache_check,$fallback_source,$timeout=6000) {

        if(!Cache::store('file')->has($cache_check)) {
            $val = eval("return $fallback_source");
            Cache::store('file')->put($cache_check, $val, $timeout);
            return $val;
        }
        
        return Cache::store('file')->get($cache_check);
    }

?>
