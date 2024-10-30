<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class AccessControlController extends Controller
{
    public function user_login() {
        $page_title = "Home Events - Login";
        $skip_header_links = true;

        return view('login',compact("page_title","skip_header_links"));
    }
    
    public function user_login_try(Request $request) {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);
                
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            $groups_ids = DB::table('users_groups')->select('groups_id')->where('users_id','=',Auth::id())->distinct()->get()->pluck('groups_id')->toArray();
            session(['user_groups_list' => $groups_ids]);
            return redirect('/users/' . Auth::id());
        } else
            return redirect()->route('login');
    }
    
    public function user_logout() {
        Auth::logout();
        session()->invalidate();
        session()->regenerateToken();

        return redirect()->route('login');
    }
}
