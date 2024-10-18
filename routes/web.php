<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeEventsController;

Route::get('/', [HomeEventsController::class, 'index']);
Route::get('/activity_object/{activity_object_id}', [HomeEventsController::class, 'activity_object']);
Route::get('/users/{user_id}', [HomeEventsController::class, 'user']);
Route::get('/event/{event_id}', [HomeEventsController::class, 'event']);
