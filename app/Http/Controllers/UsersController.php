<?php

namespace App\Http\Controllers;

use App\Models\Blank;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function index($user_id) {
        $user = new Blank('users',$user_id);
        
        return view('user',compact("user"));
    }
}
