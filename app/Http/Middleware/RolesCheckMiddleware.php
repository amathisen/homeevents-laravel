<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RolesCheckMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next,$site_roles=null,$group_roles=null): Response
    {
        if(user_has_role(ROLEIDS["ADMIN"]))
            return $next($request);

        $site_roles = explode("^",$site_roles);
        
        foreach($site_roles as $this_site_role) {
            if(user_has_role($this_site_role))
                return $next($request);
        }
    
        if($group_roles) {
            $group_id = $request->input('groups_id');
            if(!$group_id)
                return redirect()->route('index');
            $group_roles = explode("^",$group_roles);
            foreach($group_roles as $this_group_role) {
                if(user_has_group_role($group_id,$this_group_role))
                    return $next($request);
            }
        }

        return redirect()->route('index');
    }
}
