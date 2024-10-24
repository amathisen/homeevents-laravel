<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class AccessControlController extends Controller
{
    public function user_login() {
        $page_title = "Home Events - Login";

        return view('login',compact("page_title"));
    }
    
    public function user_login_try(Request $request) {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);
                
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials))
            return redirect('/users/' . Auth::id());
        else
            return redirect()->route('login');
    }
    
    public function user_logout() {
        Auth::logout();
        session()->invalidate();
        session()->regenerateToken();

        return redirect()->route('login');
    }
}
