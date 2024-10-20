<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActivityObjectController;
use App\Http\Controllers\EventsController;
use App\Http\Controllers\HomeEventsController;
use App\Http\Controllers\UsersController;

Route::get('/', [HomeEventsController::class, 'index']);
Route::get('/activity_object/{activity_object_id}', [ActivityObjectController::class, 'index']);
Route::get('/users/{user_id}', [UsersController::class, 'index']);
Route::get('/event/{event_id}', [EventsController::class, 'index']);
