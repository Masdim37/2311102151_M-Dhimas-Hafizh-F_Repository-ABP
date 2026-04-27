<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 12 - 13 (PERTEMUAN 7)<br>LARAVEL DATABASE 1 & 2</h3>
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
<a href="https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-7">
    https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-7 
</a>

## Dasar Teori

### Laravel
Laravel adalah kerangka kerja (framework) aplikasi web berbasis bahasa pemrograman PHP yang bersifat open-source dan mengimplementasikan arsitektur Model-View-Controller (MVC). Diciptakan oleh Taylor Otwell, Laravel dirancang untuk menyederhanakan proses pengembangan web yang kompleks menjadi lebih cepat, aman, dan elegan. Framework ini menyediakan berbagai ekosistem dan fitur built-in (bawaan) tingkat lanjut, seperti perutean (routing), manajemen basis data melalui pemetaan relasional objek (Eloquent ORM), sistem template engine (Blade), serta Command Line Interface (CLI) bernama Artisan. Penggunaan Laravel secara signifikan mendongkrak produktivitas pengembang dengan meminimalisir penulisan kode berulang pada konfigurasi standar pengembangan web.

### Arsitektur MVC (Model-View-Controller)
Model-View-Controller (MVC) adalah paradigma desain arsitektur perangkat lunak yang mengisolasi logika bisnis dari antarmuka pengguna, sehingga menciptakan struktur kode yang modular, skalabel, dan mudah dipelihara. Arsitektur ini membagi aplikasi ke dalam tiga pilar utama :
- Model : Lapisan abstraksi data yang merepresentasikan struktur logis dari basis data. Model bertanggung jawab penuh atas seluruh manipulasi dan transaksi back-end (CRUD), termasuk validasi, penyimpanan, serta pengambilan data dari sistem basis data.
- View : Lapisan presentasi yang mendefinisikan antarmuka grafis (User Interface). View bertugas menerima instruksi atau data terstruktur dari Controller, kemudian merendernya menjadi format visual yang dapat diinteraksikan oleh pengguna. Lapis ini umumnya direpresentasikan melalui kombinasi struktur HTML, CSS, JavaScript, atau template engine bawaan kerangka kerja.
- Controller : Lapisan intermediari (penghubung) yang memfasilitasi komunikasi antara Model dan View. Controller bertindak sebagai "otak" logika aplikasi; ia bertugas menangkap HTTP Request dari klien, memproses instruksi bisnis spesifik, berinteraksi dengan Model yang relevan untuk mengambil atau memodifikasi data, dan meneruskan hasil akhirnya untuk ditampilkan kembali oleh View.

### CRUD (Create, Read, Update, Delete)
Operasi CRUD adalah konsep dasar dalam pengelolaan data pada sistem basis data yang mencakup empat aktivitas utama, yaitu Create, Read, Update, dan Delete. Konsep ini digunakan untuk menggambarkan bagaimana data dibuat, diakses, diubah, dan dihapus dalam sebuah sistem. Dalam implementasinya, CRUD sangat erat kaitannya dengan sistem manajemen basis data seperti MySQL dan PostgreSQL, serta sering diintegrasikan dengan API dalam pengembangan aplikasi modern menggunakan framework seperti Laravel. CRUD menjadi fondasi utama dalam pengembangan aplikasi berbasis data, baik itu website, mobile app, maupun sistem enterprise.
- Create adalah operasi untuk menambahkan atau menyimpan data baru ke dalam database. Dalam konteks database, operasi ini biasanya menggunakan perintah SQL INSERT INTO. Sedangkan dalam API, operasi Create direpresentasikan dengan HTTP method POST, di mana client mengirim data ke server untuk diproses. Pada Laravel, data yang diterima akan dikelola oleh controller dan disimpan menggunakan Eloquent ORM dengan method seperti create() atau save(). Contohnya adalah saat pengguna melakukan registrasi akun, maka data pengguna tersebut akan dimasukkan ke dalam tabel database.
- Read adalah operasi untuk mengambil atau menampilkan data yang tersimpan di dalam database. Dalam SQL, operasi ini menggunakan perintah SELECT, sementara dalam API menggunakan HTTP method GET. Laravel akan menangani request ini melalui route dan controller, lalu mengambil data menggunakan Eloquent seperti all(), find(), atau query builder lainnya, dan mengembalikannya dalam bentuk response (biasanya JSON). Operasi ini digunakan untuk menampilkan informasi, seperti daftar produk, data pengguna, atau riwayat transaksi.
- Update adalah operasi untuk mengubah atau memperbarui data yang sudah ada di dalam database. Dalam SQL, digunakan perintah UPDATE, sedangkan dalam API biasanya menggunakan HTTP method PUT atau PATCH. Di Laravel, controller akan menerima data baru dari request, mencari data lama di database, lalu memperbaruinya menggunakan method update() atau save(). Contohnya adalah ketika pengguna mengedit profilnya, seperti mengganti nama atau email, maka data lama akan diperbarui dengan data baru.
- Delete adalah operasi untuk menghapus data dari database. Dalam SQL, digunakan perintah DELETE, dan dalam API menggunakan HTTP method DELETE. Laravel akan memproses request ini melalui controller, lalu menghapus data menggunakan method delete() pada model Eloquent. Dalam praktiknya, Laravel juga menyediakan fitur soft delete, yaitu data tidak langsung dihapus secara permanen, tetapi hanya diberi tanda sebagai terhapus sehingga masih bisa dipulihkan. Operasi ini biasanya digunakan untuk menghapus data yang sudah tidak diperlukan, seperti akun pengguna atau data yang tidak valid.

### MySQL
MySQL adalah sistem manajemen basis data relasional (RDBMS) yang dirancang untuk menyimpan, mengelola, dan mengambil data secara terstruktur menggunakan bahasa SQL (Structured Query Language). Saat ini MySQL dikembangkan dan dikelola oleh Oracle Corporation. MySQL dikenal karena performanya yang cepat dan efisien, terutama untuk aplikasi berbasis web seperti website dinamis, sistem informasi, dan aplikasi CRUD (Create, Read, Update, Delete). Salah satu keunggulan utama MySQL adalah kemudahan instalasi, konfigurasi, dan penggunaannya, sehingga sangat cocok bagi pemula maupun pengembang skala kecil hingga menengah. MySQL juga mendukung berbagai engine penyimpanan seperti InnoDB (yang mendukung transaksi dan foreign key) dan MyISAM (yang lebih ringan namun tanpa dukungan transaksi). Selain itu, MySQL memiliki fitur seperti replikasi database, indexing untuk mempercepat query, sistem keamanan berbasis user privilege, serta kompatibilitas yang luas dengan berbagai bahasa pemrograman seperti PHP, Python, Java, dan Node.js. Karena sifatnya yang stabil dan banyak digunakan, MySQL menjadi salah satu pilihan utama dalam pengembangan aplikasi berbasis web.

### PostgreSQL
PostgreSQL adalah sistem manajemen basis data relasional open-source yang dikenal lebih kuat dan fleksibel dalam menangani data yang kompleks serta kebutuhan skala besar. PostgreSQL dikembangkan oleh komunitas global PostgreSQL Global Development Group dan sering disebut sebagai “advanced RDBMS” karena fitur-fiturnya yang sangat lengkap. PostgreSQL sangat patuh terhadap standar SQL dan mendukung konsep ACID (Atomicity, Consistency, Isolation, Durability) secara penuh untuk menjaga keandalan transaksi. Keunggulan utama PostgreSQL terletak pada kemampuannya dalam menangani tipe data yang kompleks seperti JSON, XML, array, hingga custom data type, serta dukungan terhadap query yang kompleks, stored procedure, dan trigger. PostgreSQL juga memiliki fitur indexing lanjutan (seperti GIN dan GiST), kemampuan extensibility (bisa menambahkan fungsi atau modul sendiri), serta dukungan untuk parallel query dan data partitioning yang sangat membantu dalam pengolahan data besar (big data). Karena keandalannya, PostgreSQL banyak digunakan pada aplikasi enterprise, sistem keuangan, data analytics, dan aplikasi yang membutuhkan integritas data tinggi serta skalabilitas yang baik.

## SOAL
### 1 jelaskan tentang git branch 
### a. apa itu git branch
Git branch adalah cabang (branch) dari sebuah repository Git yang memungkinkan developer untuk mengerjakan fitur atau perubahan tanpa mengganggu kode utama (biasanya di branch main atau master).

### b. buatlah git branch dengan 2 akun berbeda dan hubungkan dengan project yang di buat di tugas 2 ( bisa dengan antar teman kelas)
Akun 1 : Masdim37
Akun 2 : DhimazHafizh
1. Siapkan Repository yang akan dibuat Branch nya
Memakai Repository Tugas 2 Web Profile yang dimiliki Akun 1 <a href="https://github.com/Masdim37/Web-Profile">(https://github.com/Masdim37/Web-Profile)</a> 
![Repository](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/1.png)

2. Tambahkan Akun 2 sebagai collaborator
Buka Settings – collaborators – add people – masukkan username Akun 2 – klik add to repository – klik Add [username Akun 2] (pastikan Akun 2 telah accept invitation)
![Add People 1](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/2.png)
![Add People 2](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/3.png)
![People Ditambahkan](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/4.png)

3. Pada editor (VSCode) masing-masing akun, lakukan clone repository
![Clone Repository](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/5.png)

4. Buat Branch untuk masing-masing akun
Akun 1 : Branch FiturA (git checkout -b FiturA)
![Branch FiturA](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/6.png)

Akun 2 : Branch FiturB (git checkout -b FiturB)
![Branch FiturB](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/7.png)

Cek pada repository bagian branches maka akan terbentuk branch FiturA dan FiturB
![Active Branches](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/8.png)

5. Commit update fitur pada Branch masing-masing akun
Akun 1 : menambahkan file FiturA.txt dan commit ke Branch FiturA (git push origin FiturA)
![Push Ke Branch FiturA](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/9.png)

Akun 2 : menambahkan file FiturB.txt dan commit ke Branch FiturB (git push origin FiturB)
![Push Ke Branch FiturB](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/10.png)

6. Satukan update dari kedua branch ke branch utama/branch main (dilakukan oleh Akun 1)
git switch main
git merge FiturA
git merge FiturB
git push origin main
![Merge ke branch Main](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/11.png)

7. cek pada repository pada branch main maka kedua file tersebut akan muncul
![Hasil Akhir Pada Repository](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/12.png)

### c kalian jelaskan apa saja fungsi nya dan apa keuntungan git branch
a. Fungsi git-branch <br>
1. Membuat jalur pengembangan terpisah dari branch utama (main) <br>
2. Mengembangkan fitur baru tanpa mengganggu kode utama <br>
3. Memperbaiki bug tanpa merusak versi stabil aplikasi <br>
4. Memungkinkan beberapa orang bekerja secara paralel dalam satu project <br>
5. Memisahkan eksperimen atau percobaan dari kode produksi <br>
6. Memudahkan pengelolaan versi fitur (fitur A, fitur B, dll) <br>

b. keuntungan memakai git-branch <br>
1.	Aman untuk kode utama; main tetap stabil dan tidak mudah rusak <br>
2. Kolaborasi lebih mudah; tiap anggota bisa punya branch sendiri <br>
3. Pekerjaan lebih terorganisir; tiap fitur punya tempat masing-masing <br>
4. Mengurangi konflik langsung di kode utama <br>
5. Memudahkan debugging; error bisa dilacak di branch tertentu <br>
6. Fleksibel untuk eksperimen; coba fitur baru tanpa risiko ke sistem utama <br>
7. Mempermudah review code sebelum digabung ke main (via merge/pull request) <br>

### d. buat juga output dan input apa saja yang dapat kalian lakukan mengunakan git branch
1. git branch = untuk melihat daftar branch
![Command git branch](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/13.png)

2. git branch nama_branch_baru = untuk membuat branch baru
![Command git branch nama_branch_baru](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/14.png)

3. git switch nama_branch = untuk pindah ke branch lain
![Command git switch nama_branch](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/15.png)

4. git merge nama_branch = menggabungkan branch
![Command git merge](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/16.png)

5. git push origin nama_branch = upload branch ke remote
![Command git push origin nama_branch](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/17.png)

6. git branch -d nama_branch = menghapus branch
![Command git branch -d nama_branch](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/18.png)

### 2.	buatlah website ( bisa mengunakan website yang di gunnakan dalam tubes ) , lalu tambahkan database yang terhubung dengan localhost
Website yang saya buat adalah website yang menyimpan data biodaat buku seperti judul buku, nama penulis, penerbit, jumlah halaman, dan tahun terbit. Website dibuat menggunakan framework laravel dengan database MySQL (Database bernama data_buku)

### Source Code
`.env (koneksi ke database data_buku)`
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=data_buku
DB_USERNAME=root
DB_PASSWORD=#isi dengan password database
```
### penjelasan
Konfigurasi tersebut merupakan pengaturan koneksi database pada file .env di Laravel yang digunakan agar aplikasi dapat terhubung dengan database. DB_CONNECTION=mysql menunjukkan bahwa database yang digunakan adalah MySQL. DB_HOST=127.0.0.1 dan DB_PORT=3306 menandakan bahwa database berjalan di server lokal dengan port default MySQL. DB_DATABASE=data_buku adalah nama database yang digunakan untuk menyimpan data aplikasi, dalam hal ini data buku. Sementara itu, DB_USERNAME=root dan DB_PASSWORD=#isi dengan password database merupakan kredensial yang digunakan untuk autentikasi saat mengakses database. Pengaturan ini penting agar Laravel dapat melakukan operasi seperti menyimpan, mengambil, memperbarui, dan menghapus data (CRUD) dengan lancar.

`Buku.php`
```php
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

```
### Penjelasan
Kode tersebut merupakan Model pada Laravel yang merepresentasikan tabel data_buku di database dan digunakan untuk berinteraksi dengan data menggunakan Eloquent ORM. Properti protected $table = 'data_buku'; digunakan untuk menentukan nama tabel secara eksplisit karena tidak mengikuti konvensi default Laravel. Selanjutnya, protected $primaryKey = 'bukuID'; menunjukkan bahwa kolom bukuID digunakan sebagai primary key, menggantikan id. Karena bukuID bertipe string (misalnya bk001), maka public $incrementing = false; menonaktifkan auto increment bawaan database, dan protected $keyType = 'string'; menetapkan tipe primary key sebagai string. Terakhir, $fillable berisi daftar kolom yang boleh diisi secara mass assignment, sehingga data seperti judul, penulis, penerbit, jumlah halaman, dan tahun terbit dapat disimpan atau diperbarui dengan aman melalui method seperti create() dan update().

`BukuController.php (file controller)`
```php
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
```
### Penjelasan
Kode tersebut merupakan controller pada Laravel yang berfungsi mengatur alur logika CRUD (Create, Read, Update, Delete) untuk data buku dengan memanfaatkan model Buku. Method index() digunakan untuk mengambil seluruh data dari tabel data_buku dan menampilkannya ke view, sedangkan create() menampilkan form untuk menambahkan data baru. Pada method store(), terdapat mekanisme pembuatan bukuID otomatis dengan format seperti bk001, bk002 menggunakan transaksi database (DB::transaction) dan lockForUpdate() agar tidak terjadi bentrok saat ada request bersamaan. Data kemudian disimpan menggunakan Buku::create().
<br>Method edit($id) berfungsi mengambil satu data berdasarkan primary key (bukuID) untuk ditampilkan pada form edit. Method update() digunakan untuk memperbarui data yang sudah ada berdasarkan ID tersebut, sementara destroy() digunakan untuk menghapus data dari database. Secara keseluruhan, controller ini menjadi penghubung antara view (tampilan) dan model (database), sehingga setiap aksi pengguna pada aplikasi dapat diproses dan disimpan dengan benar ke dalam database. 

`index.blade.php (file view utama/home)`
```html
<!DOCTYPE html>
<html>
<head>
    <title>Data Buku</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2 class="mb-4">📚 Data Buku</h2>

    <a href="{{ route('buku.create') }}" class="btn btn-primary mb-3">
        + Tambah Buku
    </a>

    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <div class="card shadow">
        <div class="card-body">

            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Judul</th>
                        <th>Penulis</th>
                        <th>Penerbit</th>
                        <th>Halaman</th>
                        <th>Tahun</th>
                        <th width="150">Aksi</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach($data as $buku)
                    <tr>
                        <td>{{ $buku->judul_buku }}</td>
                        <td>{{ $buku->penulis }}</td>
                        <td>{{ $buku->penerbit }}</td>
                        <td>{{ $buku->jumlah_halaman }}</td>
                        <td>{{ $buku->tahun_terbit }}</td>
                        <td>
                            <a href="{{ route('buku.edit', $buku->bukuID) }}" class="btn btn-warning btn-sm">
                                Edit
                            </a>

                            <form action="{{ route('buku.destroy', $buku->bukuID) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm"
                                    onclick="return confirm('Yakin hapus data?')">
                                    Hapus
                                </button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>

            </table>

        </div>
    </div>

</div>

</body>
</html>
```
### Penjelasan
Kode tersebut merupakan tampilan halaman index pada aplikasi CRUD di Laravel yang berfungsi untuk menampilkan seluruh data buku dalam bentuk tabel. Struktur HTML sudah dipadukan dengan Bootstrap melalui CDN sehingga tampilan menjadi lebih rapi, responsif, dan user-friendly. Data buku yang ditampilkan berasal dari variabel $data yang dikirim dari controller, lalu ditampilkan menggunakan perulangan @foreach untuk setiap baris data.
<br>Pada bagian atas terdapat tombol “Tambah Buku” yang mengarah ke halaman form input (buku.create). Jika terdapat pesan sukses dari proses sebelumnya (seperti tambah, edit, atau hapus data), maka akan ditampilkan menggunakan komponen alert Bootstrap. Tabel menggunakan class seperti table, table-striped, dan table-hover untuk meningkatkan keterbacaan data. Di setiap baris data, terdapat tombol Edit yang mengarah ke route buku.edit dengan parameter bukuID, serta tombol Hapus yang menggunakan form dengan method DELETE dan dilengkapi konfirmasi sebelum data dihapus. Secara keseluruhan, file ini berperan sebagai antarmuka utama untuk melihat dan mengelola data buku.

`create.blade.php (file view create/menambahkan data buku)`
```html
<!DOCTYPE html>
<html>
<head>
    <title>Tambah Buku</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2 class="mb-4">➕ Tambah Buku</h2>

    <div class="card shadow">
        <div class="card-body">

            <form action="{{ route('buku.store') }}" method="POST">
                @csrf

                <div class="mb-3">
                    <label class="form-label">Judul Buku</label>
                    <input type="text" name="judul_buku" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Penulis</label>
                    <input type="text" name="penulis" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Penerbit</label>
                    <input type="text" name="penerbit" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Jumlah Halaman</label>
                    <input type="number" name="jumlah_halaman" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Tahun Terbit</label>
                    <input type="number" name="tahun_terbit" class="form-control" required>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="{{ route('buku.index') }}" class="btn btn-secondary">
                        Kembali
                    </a>

                    <button type="submit" class="btn btn-success">
                        💾 Simpan
                    </button>
                </div>

            </form>

        </div>
    </div>

</div>

</body>
</html>
```
### penjelasan
Kode tersebut merupakan tampilan halaman create (tambah data buku) pada aplikasi CRUD di Laravel yang digunakan untuk memasukkan data buku baru ke dalam database. Halaman ini menggunakan Bootstrap melalui CDN sehingga form terlihat lebih rapi, terstruktur, dan responsif. Setiap input dibungkus dalam class mb-3 untuk memberikan jarak antar field, serta menggunakan form-control agar tampilan input konsisten dan nyaman digunakan.
<br>Form ini mengirim data ke route buku.store menggunakan method POST, yang kemudian akan diproses oleh controller untuk disimpan ke database. Directive @csrf digunakan sebagai pengaman untuk mencegah serangan CSRF. Field yang tersedia meliputi judul buku, penulis, penerbit, jumlah halaman, dan tahun terbit, yang semuanya wajib diisi (required). Di bagian bawah terdapat dua tombol, yaitu Kembali untuk kembali ke halaman index dan Simpan untuk mengirim data. Secara keseluruhan, halaman ini berfungsi sebagai antarmuka input data yang sederhana namun sudah memenuhi standar tampilan modern.

`edit.blade.php (file view edit data buku)`
```html
<!DOCTYPE html>
<html>
<head>
    <title>Edit Buku</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2 class="mb-4">✏️ Edit Buku</h2>

    <div class="card shadow">
        <div class="card-body">

            <!-- ERROR VALIDATION -->
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul class="mb-0">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form action="{{ route('buku.update', $buku->bukuID) }}" method="POST">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label class="form-label">Judul Buku</label>
                    <input type="text" name="judul_buku" class="form-control"
                        value="{{ $buku->judul_buku }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Penulis</label>
                    <input type="text" name="penulis" class="form-control"
                        value="{{ $buku->penulis }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Penerbit</label>
                    <input type="text" name="penerbit" class="form-control"
                        value="{{ $buku->penerbit }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Jumlah Halaman</label>
                    <input type="number" name="jumlah_halaman" class="form-control"
                        value="{{ $buku->jumlah_halaman }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Tahun Terbit</label>
                    <input type="number" name="tahun_terbit" class="form-control"
                        value="{{ $buku->tahun_terbit }}" required>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="{{ route('buku.index') }}" class="btn btn-secondary">
                        Kembali
                    </a>

                    <button type="submit" class="btn btn-primary">
                        🔄 Update
                    </button>
                </div>

            </form>

        </div>
    </div>

</div>

</body>
</html>
```
### penjelasan
Kode tersebut merupakan tampilan halaman edit data buku pada aplikasi CRUD di Laravel yang digunakan untuk memperbarui data buku yang sudah ada di database. Halaman ini sudah menggunakan Bootstrap sehingga tampilan form terlihat rapi, modern, dan responsif. Data buku yang akan diedit dikirim dari controller ke view melalui variabel $buku, kemudian ditampilkan kembali ke dalam input form menggunakan atribut value, sehingga pengguna dapat melihat dan mengubah data lama dengan mudah.
<br>Form ini mengarah ke route buku.update dengan parameter bukuID dan menggunakan method POST yang disertai @method('PUT') untuk menyesuaikan dengan standar RESTful Laravel dalam proses update. Directive @csrf digunakan untuk keamanan dari serangan CSRF. Selain itu, terdapat fitur validasi error yang akan menampilkan pesan kesalahan jika input tidak sesuai aturan yang ditentukan. Di bagian bawah, tersedia tombol Kembali untuk kembali ke halaman utama dan tombol Update untuk menyimpan perubahan data. Secara keseluruhan, halaman ini berfungsi sebagai antarmuka yang memudahkan pengguna dalam mengedit data buku secara aman dan terstruktur.

`web.php (file routing)`
```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BukuController;

Route::get('/', [BukuController::class, 'index']);

Route::resource('buku', BukuController::class);
```
### Penjelasan
Kode tersebut merupakan konfigurasi routing pada Laravel yang mengatur hubungan antara URL dan controller. Route / diarahkan ke method index() pada BukuController sehingga halaman utama langsung menampilkan data buku. Sementara itu, Route::resource('buku', BukuController::class); secara otomatis membuat seluruh route CRUD (create, read, update, delete) sehingga pengelolaan data buku menjadi lebih mudah dan terstruktur tanpa perlu menulis route satu per satu.

### Output Cara Kerja Website
1. Jalankan php artisan serve pada terminal 
![php artisan serve](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/19.png)

2. Buka http://127.0.0.1:8000 pada browser
![run website](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/20.png)

3. Lakukan penambahan data buku (operasi create) dengan menekan tombol tambah buku & isi form, kemudian tekan tombol simpan
![operasi create](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/21.png)

4. Akan diarahkan ke halaman home (index) dengan ditampilkannya data buku yang baru dimasukkan
![home after operasi create](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/22.png)

Berikut isi dari database data_buku (data buku yang baru dimasukkan sudah ada didalam database)
![database after operasi create](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/23.png)

5. Lakukan edit data buku (operasi update) dengan menekan tombol edit pada salah satu baris data buku & isi form, kemudian tekan tombol update
![operasi update](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/24.png)

6. Akan diarahkan ke halaman home (index) dengan ditampilkannya data buku yang baru diedit
![home after operasi update](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/25.png)

Berikut isi dari database data_buku (data buku yang baru diedit sudah berubah)
![database after operasi update](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/26.png)

7. Lakukan hapus data buku (operasi delete) dengan menekan tombol hapus pada salah satu baris data buku, kemudian pada pop up yang muncul, tekan oke
![operasi delete](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/27.png)

8. Akan diarahkan ke halaman home (index) dengan data buku yang dihapus menghilang
![home after operasi delete](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/28.png)

Berikut isi dari database data_buku (data buku yang baru dihapus menghilang)
![database after operasi delete](https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/blob/master/Pertemuan-7/AssetScreenshot/29.png)