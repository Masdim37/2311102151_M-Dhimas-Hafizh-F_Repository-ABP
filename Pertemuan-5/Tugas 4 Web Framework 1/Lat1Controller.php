<?php

namespace App\Http\Controllers;

class Lat1Controller extends Controller{
    public function index() {
        $data["nama"]="Muhammad Dhimas Hafizh Fathurrahman";
        $data["NIM"]="2311102151";
        $data["Kelas"]="PS1IF-11-REG04";
        $data["asal"]="Bekasi";
        return view('v_latihan1', $data);
    }

    public function method2(){
        $data['title'] = "Daftar Mahasiswa";
        $data['daf_mhs'] = array(
            array("nama" => "M Dhimas Hafizh F", "asal" => "Bekasi"),
            array("nama" => "Agus", "asal" => "Bandung"),
            array("nama" => "Budi", "asal" => "Jakarta"),
            array("nama" => "Roni", "asal" => "Surabaya")
        );
        return view('v_latihan2', $data);
    }
}