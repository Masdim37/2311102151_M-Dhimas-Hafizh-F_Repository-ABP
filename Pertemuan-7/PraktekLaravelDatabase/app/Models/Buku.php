<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Buku extends Model
{
    protected $table = 'data_buku';

    protected $primaryKey = 'bukuID';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'bukuID',
        'judul_buku',
        'penulis',
        'penerbit',
        'jumlah_halaman',
        'tahun_terbit'
    ];
}