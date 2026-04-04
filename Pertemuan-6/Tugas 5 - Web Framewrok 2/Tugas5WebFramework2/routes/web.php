<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

Route::get('/', function () {
    return redirect('/login');
});

Route::get('/login', [App\Http\Controllers\AuthController::class, 'login'])->name('login');

Route::post('/auth', [App\Http\Controllers\AuthController::class, 'auth']);

Route::get('/registration', [App\Http\Controllers\AuthController::class, 'registration'])->name('registration');

Route::post('/register', [App\Http\Controllers\AuthController::class, 'register']);

Route::get('/home', [App\Http\Controllers\AuthController::class, 'home']);

Route::get('/logout', [App\Http\Controllers\AuthController::class, 'logout'])->name('logout');






