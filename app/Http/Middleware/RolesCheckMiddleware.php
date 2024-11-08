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
    public function handle(Request $request, Closure $next,$site_role,$group_role=null): Response
    {
        if(user_has_role($site_role))
            return $next($request);

        if($group_role) {
            $group_id = $request->input('groups_id');
            if(!$group_id || !user_has_group_role($group_id,$group_role))
                return redirect()->route('index');

            return $next($request);
        }

        return redirect()->route('index');
    }
}
