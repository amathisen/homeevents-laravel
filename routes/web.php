<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AccessControlController;
use App\Http\Controllers\ActivityObjectController;
use App\Http\Controllers\EventsController;
use App\Http\Controllers\HomeEventsController;
use App\Http\Controllers\LocationController;
use App\Http\Controllers\ObjectsController;
use App\Http\Controllers\UsersController;

Route::get('/login', [AccessControlController::class, 'user_login'])->name('login');
Route::post('/login/try', [AccessControlController::class, 'user_login_try']);

Route::group( ['middleware' => 'auth' ], function() {

    Route::get('/', [HomeEventsController::class, 'index'])->name('index');

    Route::get('/logout', [AccessControlController::class, 'user_logout'])->name('logout');

    Route::get('/activity_object/{activity_object_id}', [ActivityObjectController::class, 'index'])->name('activity_object_details');
    Route::get('/users/{users_id}', [UsersController::class, 'index'])->name('users_details');
    Route::get('/event/{event_id}', [EventsController::class, 'index'])->name('event_details');
    Route::get('/location/{location_id}', [LocationController::class, 'index'])->name('location_details');
    
    Route::group(['prefix' => '/objects'], function()
    {
        Route::middleware('RolesCheck:' . ROLEIDS["ADMIN"])->controller(ObjectsController::class)->group(function () {
            Route::post('/crud', 'object_crud');
            Route::get('/{object_type}/{object_id}', 'object_edit')->name('show_object');
            Route::get('/{object_type}', 'objects_list')->name('show_objects');
            Route::get('/', 'index')->name('show_object_types');
        });
    });
});
