<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller {
    public function login(){
        return view('login');
    }

    public function auth(Request $request){
        $credential = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required']
        ]);
        if(Auth::attempt($credential)){
            $request->session()->regenerate();
            return redirect('/home');
        }

        return back()->withErrors([
            'email' => 'Email atau password salah'
        ]);
    }

    public function registration(){
        return view('registration');
    }

    public function register(Request $request){
        $credential = $request->validate([
            'email' => 'required|string|email|max:255|unique:user',
            'name' => 'required|string|max:255',
            'password' => 'required|string|max:255'
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return redirect('/registration')->with('success', 'Registrasi berhasil!');
    }

    public function home(){
        if(Auth::check()){
            return view('home', ['user' =>Auth::user()]);
        }
        return redirect('/login');
    }

    public function logout(){
        Auth::logout();
        session()->invalidate();
        session()->regenerateToken();

        return redirect('/login');
    }
}
