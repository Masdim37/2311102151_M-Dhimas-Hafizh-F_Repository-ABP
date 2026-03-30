<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Lat1Controller;

Route::get('/', function () {
    return redirect('/lat1');
});

Route::get('/lat1', [App\Http\Controllers\Lat1Controller::class, 'index']);

Route::get('/lat1/m2', [App\Http\Controllers\Lat1Controller::class, 'method2']);