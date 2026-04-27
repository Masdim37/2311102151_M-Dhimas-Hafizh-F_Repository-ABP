<?php

namespace App\Http\Controllers;

use App\Models\Buku;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BukuController extends Controller
{
    public function index()
    {
        $data = Buku::all();
        return view('buku.index', compact('data'));
    }

    public function create()
    {
        return view('buku.create');
    }

    public function store(Request $request)
    {
        $kode = DB::transaction(function () {
            // ambil terakhir berdasarkan urutan bukuID
            $last = Buku::orderBy('bukuID', 'desc')->lockForUpdate()->first();

            if ($last) {
                $num = (int) substr($last->bukuID, 2);
                $num++;
            } else {
                $num = 1;
            }

            return 'bk' . str_pad($num, 3, '0', STR_PAD_LEFT);
        });

        Buku::create([
            'bukuID' => $kode,
            'judul_buku' => $request->judul_buku,
            'penulis' => $request->penulis,
            'penerbit' => $request->penerbit,
            'jumlah_halaman' => $request->jumlah_halaman,
            'tahun_terbit' => $request->tahun_terbit,
        ]);

        return redirect()->route('buku.index');
    }

    public function edit($id)
    {
        $buku = Buku::findOrFail($id);
        return view('buku.edit', compact('buku'));
    }

    public function update(Request $request, $id)
    {
        $buku = Buku::findOrFail($id);
        $buku->update($request->all());

        return redirect()->route('buku.index')->with('success', 'Data berhasil diupdate');
    }

    public function destroy($id)
    {
        Buku::findOrFail($id)->delete();
        return redirect()->route('buku.index')->with('success', 'Data berhasil dihapus');
    }
}