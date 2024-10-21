<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActivityObjectController;
use App\Http\Controllers\EventsController;
use App\Http\Controllers\HomeEventsController;
use App\Http\Controllers\ObjectsController;
use App\Http\Controllers\UsersController;

Route::get('/', [HomeEventsController::class, 'index']);
Route::get('/activity_object/{activity_object_id}', [ActivityObjectController::class, 'index']);
Route::get('/users/{user_id}', [UsersController::class, 'index']);
Route::get('/event/{event_id}', [EventsController::class, 'index']);

Route::post('/objects/crud', [ObjectsController::class, 'object_crud']);
Route::get('/objects/{object_type}/{object_id}', [ObjectsController::class, 'object_edit'])->name('show_object');
Route::get('/objects/{object_type}', [ObjectsController::class, 'objects_list'])->name('show_objects');
Route::get('/objects', [ObjectsController::class, 'index'])->name('show_object_types');
