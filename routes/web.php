<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AccessControlController;
use App\Http\Controllers\ActivityObjectController;
use App\Http\Controllers\EventsController;
use App\Http\Controllers\HomeEventsController;
use App\Http\Controllers\ObjectsController;
use App\Http\Controllers\UsersController;

require_once(app_path() . '/define.php');

Route::get('/login', [AccessControlController::class, 'user_login'])->name('login');
Route::post('/login/try', [AccessControlController::class, 'user_login_try']);

Route::group( ['middleware' => 'auth' ], function() {

    Route::get('/', [HomeEventsController::class, 'index']);

    Route::get('/logout', [AccessControlController::class, 'user_logout'])->name('logout');

    Route::get('/activity_object/{activity_object_id}', [ActivityObjectController::class, 'index'])->name('activity_object_details');
    Route::get('/users/{users_id}', [UsersController::class, 'index'])->name('users_details');
    Route::get('/event/{event_id}', [EventsController::class, 'index'])->name('event_details');
    
    Route::post('/objects/crud', [ObjectsController::class, 'object_crud']);
    Route::get('/objects/{object_type}/{object_id}', [ObjectsController::class, 'object_edit'])->name('show_object');
    Route::get('/objects/{object_type}', [ObjectsController::class, 'objects_list'])->name('show_objects');
    Route::get('/objects', [ObjectsController::class, 'index'])->name('show_object_types');

});
