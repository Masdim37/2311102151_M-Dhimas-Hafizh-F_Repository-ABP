<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Validation\Rules\Exists;


class mahasiswaController extends Controller{
    public function getDataMahasiswa(){
        //definisikan path ke data .json
        $datapath = storage_path('app/data/mahasiswa.json');
        
        //cek apakah data ada atau tidak
        if (!File::exists($datapath)){
            return response()->json(['error'=> 'Data tidak ditemukan'], 404);
        }
        //membaca isi file json
        $jsonData = File::get($datapath);

        //ubah json kedalam array php
        $arrayData = json_decode($jsonData, true);

        //kembalikan data dalam format json
        return response()->json($arrayData);
    }
}
