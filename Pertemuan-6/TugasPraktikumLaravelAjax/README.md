<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL ...<br>LARAVEL & AJAX</h3>
  <br />
  <img src="https://upload.wikimedia.org/wikipedia/commons/0/03/Logo_Telkom_University_potrait.png" alt="Logo" width="300"> 
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Muhammad Dhimas Hafizh Fathurrahman</strong><br>
    <strong>2311102151</strong><br>
    <strong>PS1IF-11-REG04</strong>
  </p>
  <br />
  <h3>Dosen Pengampu :</h3>
  <p>
    <strong>Cahyo Prihantoro, S.Kom., M.Eng</strong>
  </p>
  <br />
    <h4>Asisten Praktikum :</h4>
    <strong>Gilang Saputra</strong> <br>
    <strong>Rangga Pradarrell Fathi</strong>
  <br />
  <h3>LABORATORIUM HIGH PERFORMANCE
 <br>PROGRAM STUDI TEKNIK INFORMATIKA<br>FAKULTAS INFORMATIKA<br>UNIVERSITAS TELKOM PURWOKERTO<br>2026</h3>
</div>

---

## LINK GIT
<a href="https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-6/TugasPraktikumLaravelAjax">
    https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-6/TugasPraktikumLaravelAjax 
</a>

## 1. Dasar Teori

### Laravel
Laravel adalah kerangka kerja (framework) aplikasi web berbasis bahasa pemrograman PHP yang bersifat open-source dan mengimplementasikan arsitektur Model-View-Controller (MVC). Diciptakan oleh Taylor Otwell, Laravel dirancang untuk menyederhanakan proses pengembangan web yang kompleks menjadi lebih cepat, aman, dan elegan. Framework ini menyediakan berbagai ekosistem dan fitur built-in (bawaan) tingkat lanjut, seperti perutean (routing), manajemen basis data melalui pemetaan relasional objek (Eloquent ORM), sistem template engine (Blade), serta Command Line Interface (CLI) bernama Artisan. Penggunaan Laravel secara signifikan mendongkrak produktivitas pengembang dengan meminimalisir penulisan kode berulang pada konfigurasi standar pengembangan web.

### Arsitektur MVC (Model-View-Controller)
Model-View-Controller (MVC) adalah paradigma desain arsitektur perangkat lunak yang mengisolasi logika bisnis dari antarmuka pengguna, sehingga menciptakan struktur kode yang modular, skalabel, dan mudah dipelihara. Arsitektur ini membagi aplikasi ke dalam tiga pilar utama :
- Model : Lapisan abstraksi data yang merepresentasikan struktur logis dari basis data. Model bertanggung jawab penuh atas seluruh manipulasi dan transaksi back-end (CRUD), termasuk validasi, penyimpanan, serta pengambilan data dari sistem basis data.
- View : Lapisan presentasi yang mendefinisikan antarmuka grafis (User Interface). View bertugas menerima instruksi atau data terstruktur dari Controller, kemudian merendernya menjadi format visual yang dapat diinteraksikan oleh pengguna. Lapis ini umumnya direpresentasikan melalui kombinasi struktur HTML, CSS, JavaScript, atau template engine bawaan kerangka kerja.
- Controller : Lapisan intermediari (penghubung) yang memfasilitasi komunikasi antara Model dan View. Controller bertindak sebagai "otak" logika aplikasi; ia bertugas menangkap HTTP Request dari klien, memproses instruksi bisnis spesifik, berinteraksi dengan Model yang relevan untuk mengambil atau memodifikasi data, dan meneruskan hasil akhirnya untuk ditampilkan kembali oleh View.

### Bootstrap
Bootstrap adalah kerangka kerja (framework) CSS front-end populer yang dimanfaatkan untuk merancang antarmuka web secara cepat, responsif, dan modern tanpa harus menulis kode CSS dasar dari awal. Dengan mengadopsi pendekatan mobile-first design, Bootstrap menyediakan sistem grid 12-kolom yang fleksibel, arsitektur flexbox, serta pustaka komponen User Interface (UI) siap pakai seperti navigasi, tata letak kartu (card), modal, dan tipografi. Otomatisasi tata letak ini memastikan bahwa elemen visual situs web dapat beradaptasi secara dinamis dan konsisten di berbagai ukuran resolusi layar, mulai dari layar gawai seluler hingga monitor komputer.

### AJAX (Asynchronous JavaScript and XML)
AJAX (Asynchronous JavaScript and XML) adalah serangkaian teknik pemrograman dan pengembangan web yang menggabungkan berbagai teknologi sisi klien untuk membuat interaksi aplikasi web menjadi asinkron. Mekanisme utama dari AJAX adalah kemampuannya untuk berkomunikasi, mengambil, mengirim, serta menerima data dari server di latar belakang secara independen, tanpa perlu memuat ulang (reload atau refresh) keseluruhan halaman web. Meskipun singkatan AJAX mengandung unsur kata "XML", format pertukaran data yang digunakan pada era modern saat ini cenderung beralih secara masif menggunakan JSON (JavaScript Object Notation). JSON lebih diutamakan karena formatnya yang jauh lebih universal, ringan, dan sejalan langsung dengan sintaks bawaan JavaScript.
<br>Secara teknis, untuk melakukan eksekusi permintaan (request) data dari sisi klien, antarmuka standar modern (API) yang kini paling banyak diimplementasikan pada berbagai peramban web (web browser) adalah fungsionalitas fetch(). API ini hadir sebagai standar baru yang menggantikan objek XMLHttpRequest yang mulai usang. Penggunaan fetch() sangat diunggulkan karena telah mendukung arsitektur Promises, yang secara signifikan memberikan kemudahan dalam penanganan sinkronisasi eksekusi HTTP asinkron. Pendekatan ini membuat struktur kode menjadi lebih rapi, mempermudah perangkaian instruksi lanjutan (chaining dengan .then()), serta meningkatkan keterbacaan dan kemudahan pemeliharaan sistem.
<br>Melalui penerapan teknik AJAX ini, aplikasi web dapat memanipulasi elemen Document Object Model (DOM) secara dinamis, sebagai contoh, memperbarui rincian pada tabel data mahasiswa secara seketika. Integrasi keseluruhan proses ini pada akhirnya menghasilkan pengalaman pengguna (User Experience) yang jauh lebih interaktif, cepat, efisien, dan mulus, sehingga memberikan sensasi interaksi yang menyerupai kelancaran sebuah aplikasi desktop atau Single Page Application (SPA).

### JSON (JavaScript Object Notation)
JSON (JavaScript Object Notation) adalah format serialisasi dan pertukaran data tekstual berbasis standar terbuka (RFC 8259) yang ringan, mudah dibaca oleh manusia (human-readable), serta efisien untuk diurai (parsing) maupun dihasilkan oleh mesin. JSON merepresentasikan data menggunakan struktur pasangan kunci-nilai (key-value pairs) dan susunan nilai terurut (array). Berfungsi sebagai jembatan komunikasi universal antara sistem front-end (seperti skrip AJAX) dan back-end (seperti balasan controller Laravel), JSON secara efektif telah menjadi standar de facto industri. Format ini banyak menggantikan protokol lama seperti XML karena strukturnya yang lebih ringkas, sehingga mempercepat waktu transmisi data melintasi jaringan API (Application Programming Interface).

## 2. Stuktur Folder
```
TugasParktikumLaravelAjx/   
│
├── app/                    
|   ├── Http/               
|   |   └── Controllers/    
|   |       └── mahasiswaController.php  # File Controller yang dipakai
|   |
|   ├── resources/        
|   |   └── views/        
|   |       └── mahasiswa.blade.php      # File blade sebagai view yang ditampilkan
|   |
|   ├── routes/             
|   |   └── web.php                      # File untuk routing URL - Controller
|   |
|   └── storage/              
|       └── app/           
|           └── data/   
|               └── mahasiswa.json      # File JSON sebagai penyimpanan data
|
└── README.md                           # File Laporan Praktikum
```

## 2. Sourcecode 

### mahasiswa.json
```json
[
    {
        "nama": "Muhammad Dhimas Hafizh Fathurrahman",
        "nim": "2311102151",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Muhammad Arsyad Zaidan",
        "nim": "2311102058",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Irfan Thoriq Habibi",
        "nim": "2311102131",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Christoba Joshua Hutagalung",
        "nim": "2311102133",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Daffa Falih Aqilah",
        "nim": "2311102137",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Muhammad Nizal Maulana",
        "nim": "2311102150",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Naufal Geraldo Putra Pramudianartono",
        "nim": "2311102131",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    }
]
```
Penjelasan Singkat :
<br>File mahasiswa.json adalah file teks berformat JSON (JavaScript Object Notation) yang berfungsi sebagai media penyimpanan data statis. File ini bertindak sebagai representasi sumber data (data source) alternatif atau basis data tiruan (mock database) yang menyimpan sekumpulan informasi terstruktur mengenai data mahasiswa. Data ini disusun dalam bentuk array yang berisi beberapa objek, di mana setiap objek merepresentasikan satu entitas mahasiswa dengan atribut spesifik seperti nama, nim, kelas, dan prodi. Format standar JSON ini sangat efisien karena mempermudah controller Laravel dalam melakukan proses pembacaan (reading), penguraian (parsing) menjadi array PHP, dan transmisi ulang secara mulus ke antarmuka klien (front-end) untuk kemudian dirender menjadi elemen visual secara dinamis menggunakan skrip AJAX.

### mahasiswaController.php (file controller)
``` php
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

```
Penjelasan singkat :
<br>File mahasiswaController.php bertugas sebagai file controller atau otak logika aplikasi. Pada file ini terdapat 1 function bernama getDataMahasiswa() yang berfungsi untuk mengambil data dari mahasiswa.json dan mengembalikannya dalam format JSON. Cara kerja function ini pertama menginisiasi variabel $datapath yang berisi path atau jalur tempat mahasiswa.json disimpan (di dalam storage/app/data/mahasiswa.json). Kemudian, dilakukan pengecekan apakah file mahasiswa.json tersebut ada atau tidak menggunakan fungsi exists(). Apabila tidak ditemukan, sistem akan mengembalikan respons JSON error "Data tidak ditemukan". Apabila data ditemukan, sistem akan mengeksekusi metode File::get($datapath) untuk membaca keseluruhan isi dari file mahasiswa.json dan menyimpannya ke dalam variabel $jsonData dalam format string. Selanjutnya, string mentah tersebut diurai (parsing) menjadi struktur array asosiatif PHP menggunakan fungsi json_decode($jsonData, true). Hasil konversi ini kemudian disimpan di dalam variabel $arrayData agar lebih mudah dikelola atau dimodifikasi oleh sistem. Terakhir, controller menggunakan fungsi response()->json($arrayData) untuk memformat ulang array tersebut kembali menjadi struktur JSON yang baku, sekaligus menyematkan header HTTP yang sesuai, lalu mengirimkannya sebagai respons balasan kepada klien (front-end).

### mahasiswa.blade.php (file view)
```html
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas Praktikum Laravel + AJAX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container mt-5">
        <h1 class="mb-4 text-center">Data Mahasiswa</h1>

        <div class="text-center mb-4">
            <button id="btnTampilData" class="btn btn-primary">Tampilkan Data</button>
        </div>

        <div class="row" id="areaHasilData"></div>
    </div>

    <script>
        document.getElementById('btnTampilData').addEventListener('click', function () {
            //mengambil elemen tempat hasil data akan ditaruh
            const areaHasil = document.getElementById('areaHasilData');

            //memberikan indikator loading
            areaHasil.innerHTML = '<div class="col-12 text-center text-muted">Mengambil data...</div>';

            //melakukan request AJAX dengan Fetch API
            fetch('/mahasiswa')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Terjadi kesalahan jaringan');
                    }
                    return response.json();
                })
                .then(data => {
                    //mengosongkan area hasil sebelum merender data baru
                    areaHasil.innerHTML = '';

                    //looping data JSON dan membuat struktur HTML Card
                    data.forEach(mhs => {
                        const cardHtml = `
                            <div class="col-md-4 mb-3">
                                <div class="card shadow-sm h-100">
                                    <div class="card-body">
                                        <p class="card-text mb-1">
                                            <strong>Nama :</strong> ${mhs.nama}
                                        </p>
                                        <p class="card-text mb-1">
                                            <strong>NIM :</strong> ${mhs.nim}
                                        </p>
                                        <p class="card-text mb-1">
                                            <strong>Kelas :</strong> ${mhs.kelas}
                                        </p>
                                        <p class="card-text">
                                            <strong>Prodi :</strong> ${mhs.prodi}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        `;
                        //menyisipkan card ke dalam area hasil
                        areaHasil.innerHTML += cardHtml;
                    });
                })
                .catch(error => {
                    console.error('Error:', error);
                    areaHasil.innerHTML = '<div class="col-12 text-center text-danger">Gagal memuat data.</div>';
                });
        });
    </script>
</body>

</html>
```
Penjelasan Singkat :
<br>File mahasiswa.blade.php bertugas sebagai file view atau tampilan dalam aplikasi ini yang berfungsi untuk menampilkan data mahasiswa kepada user dalam bentuk antarmuka web yang interaktif. Pada file ini digunakan kombinasi HTML untuk menyusun struktur halaman, Bootstrap untuk mempercantik tampilan agar lebih rapi dan responsif, serta JavaScript dengan Fetch API (AJAX) untuk mengambil data dari server secara asynchronous tanpa perlu melakukan reload halaman. Ketika pengguna menekan tombol “Tampilkan Data”, event listener pada tombol akan dijalankan, kemudian sistem mengambil elemen areaHasilData dan menampilkan indikator loading berupa teks “Mengambil data...”. Setelah itu, AJAX bekerja melalui fungsi fetch('/mahasiswa') yang mengirimkan HTTP request ke server (controller) pada endpoint tersebut. Jika response dari server (controller) berhasil (status OK), maka data akan diubah ke format JSON menggunakan response.json(). Selanjutnya, data yang diterima akan diproses dengan perulangan (forEach), di mana setiap data mahasiswa akan dibuatkan elemen HTML berbentuk card menggunakan template string, lalu ditambahkan ke dalam areaHasilData. Sebelum data baru ditampilkan, isi elemen tersebut dikosongkan terlebih dahulu untuk menghindari duplikasi. Jika terjadi error saat proses request, maka akan ditangani oleh blok catch dengan menampilkan pesan “Gagal memuat data”. Pendekatan AJAX ini memungkinkan data ditampilkan secara dinamis tanpa reload halaman, sehingga meningkatkan performa dan memberikan pengalaman pengguna yang lebih cepat dan modern.

### web.php (file routing)
```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\mahasiswaController;

Route::get('/', function () {
    return view('mahasiswa');
});

Route::get('/mahasiswa', [MahasiswaController::class, 'getDataMahasiswa']);
```
Penjelasan Singkat :
<br>File web.php bertugas sebagai file routing dalam framework Laravel yang berfungsi untuk mengatur jalur (route) atau URL yang dapat diakses oleh user serta menghubungkannya dengan proses atau logika tertentu di dalam aplikasi. Pada file tersebut, terdapat dua route yang didefinisikan. Route pertama yaitu '/' digunakan untuk menampilkan halaman utama dengan mengembalikan view mahasiswa, sehingga ketika pengguna membuka halaman awal aplikasi, sistem akan langsung menampilkan file mahasiswa.blade.php. Route kedua yaitu '/mahasiswa' digunakan untuk menangani permintaan data mahasiswa melalui AJAX, di mana route ini diarahkan ke method getDataMahasiswa() yang terdapat pada MahasiswaController.

## 3. Penjelasan Cara Kerja Aplikasi
Berikut merupakan cara kerja aplikasi :

1. Jalankan aplikasi dengan mengetik command php artisan serve pada terminal.
![Run Program](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-6/ScreenshotOutputTugasPraktikumLaravelAjax/run-program.png)

2. Buka http://127.0.0.1:8000 pada browser, kemudian akan ditampilkan halaman awal yang berisi judul dan tombol Tampilkan Data.
![Tampilan Awal](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-6/ScreenshotOutputTugasPraktikumLaravelAjax/tampilan-awal.png)

3. Tekan tombol Tampilkan Data, kemudian aplikasi akan mengirimkan request AJAX menggunakan Fetch API ke endpoint /mahasiswa. Selama proses berlangsung, akan ditampilkan indikator loading berupa teks “Mengambil data...”.
![Mengambil Data](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-6/ScreenshotOutputTugasPraktikumLaravelAjax/mengambil-data.png)

4. Data ditampilkan dalam bentuk card Bootstrap yang disusun secara dinamis di dalam halaman, di mana setiap card berisi informasi mahasiswa seperti nama, NIM, kelas, dan program studi tanpa perlu melakukan reload halaman.
![Data Ditampilkan](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-6/ScreenshotOutputTugasPraktikumLaravelAjax/data-ditampilkan.png)
