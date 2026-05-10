<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>PERTEMUAN 9 - MOBILE</h3>
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
<a href="https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-9">
    https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-9 
</a>

---

## TUGAS PERTEMUAN 9 MOBILE
📝 Tugas Praktikum Modul 4-5 Flutter

Buat 1 project Flutter yang menampilkan beberapa widget UI berikut:
<br>🔹 Yang harus ada:
<br>Container → kotak berwarna
<br>GridView → minimal 6 item (grid)
<br>ListView → 3 item (A, B, C)
<br>ListView.builder → list dari data array
<br>ListView.separated → list + garis pembatas
<br>Stack → tampilan bertumpuk (kotak / text)

📦 Output yang dikumpulkan: Screenshot hasilnya Source code Penjelasan singkat tiap widget

## JAWABAN

### Source Code main.dart
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Layanan IT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data untuk ListView.builder dan ListView.separated
  final List<String> layananIT = const [
    'Servis Laptop & PC',
    'Instalasi Sistem Operasi',
    'Recovery Data Storage',
    'Setup Jaringan & Router',
    'Perbaikan Hardware',
  ];

  // Data array untuk GridView
  final List<Map<String, dynamic>> gridItems = const [
    {'title': 'Jaringan', 'icon': Icons.router, 'color': Colors.indigo},
    {'title': 'Keamanan', 'icon': Icons.security, 'color': Colors.redAccent},
    {'title': 'Cloud', 'icon': Icons.cloud, 'color': Colors.orange},
    {'title': 'Software', 'icon': Icons.laptop_windows, 'color': Colors.green},
    {'title': 'Hardware', 'icon': Icons.memory, 'color': Colors.deepPurple},
    {'title': 'Riwayat', 'icon': Icons.history, 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      appBar: AppBar(
        title: const Text(
          'Tugas Pertemuan 9 - Mobile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CONTAINER
            sectionTitle('1. Container'),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.lightBlue],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.computer, color: Colors.white, size: 38),
                    SizedBox(height: 8),
                    Text(
                      "Muhammad Dhimas Hafizh Fathurrahman",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2311102151',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),

            //GRIDVIEW
            sectionTitle('2. GridView Kategori Layanan'),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gridItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                final item = gridItems[index];
                return Container(
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: item['color'].withOpacity(0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'], size: 42, color: Colors.white),
                      const SizedBox(height: 10),
                      Text(
                        item['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            //LISTVIEW
            sectionTitle('3. ListView Status Perbaikan'),
            SizedBox(
              height: 180,
              child: ListView(
                children: const [
                  CustomTile('Pengecekan Masalah', Icons.search),
                  CustomTile('Sedang Diperbaiki', Icons.build_circle),
                  CustomTile(
                    'Perangkat Siap Diambil',
                    Icons.check_circle_outline,
                  ),
                ],
              ),
            ),

            //LISTVIEW.BUILDER
            sectionTitle('4. ListView.builder Paket IT'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                itemCount: layananIT.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        layananIT[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Tersedia untuk perorangan & instansi',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),

            //LISTVIEW.SEPARATED
            sectionTitle('5. ListView.separated Detail Layanan'),
            SizedBox(
              height: 230,
              child: ListView.separated(
                itemCount: layananIT.length,
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1.2, color: Colors.indigoAccent),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.settings_ethernet,
                      color: Colors.indigoAccent,
                    ),
                    title: Text(
                      'Layanan: ${layananIT[index]}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('Pengerjaan cepat dan bergaransi'),
                    trailing: const Icon(Icons.verified, color: Colors.green),
                  );
                },
              ),
            ),

            //STACK
            sectionTitle('6. Stack Promo Servis'),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.settings_suggest,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 95,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.speed,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 28,
                    right: 24,
                    child: Text(
                      'Fast & Reliable',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk judul section
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }
}

// Widget tambahan untuk ListView statis
class CustomTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomTile(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Update status pengerjaan IT'),
      ),
    );
  }
}
```

### Screenshot Output 
![Screenshot Output 1](https://raw.githubusercontent.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/master/Pertemuan-9/ScreenshotOutput/1.jpg)

![Screenshot Output 2](https://raw.githubusercontent.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/master/Pertemuan-9/ScreenshotOutput/2.jpg)

![Screenshot Output 3](https://raw.githubusercontent.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/master/Pertemuan-9/ScreenshotOutput/3.jpg)

### Penjelasan Setiap Widget

#### 1. Container
Container merupakan widget dasar pada Flutter yang berfungsi sebagai wadah atau kotak pembungkus untuk menampilkan dan mengatur widget lain di dalamnya. Widget ini dapat dikustomisasi mulai dari ukuran, warna, margin, padding, hingga dekorasi visual seperti gradasi warna, sudut melengkung, dan bayangan. Pada kode main.dart, widget Container digunakan sebagai kartu profil sederhana dengan tampilan modern dan menarik.

Berikut penjelasan Widget Container yang digunakan pada main.dart : 

1. Dimensi Container
<br>Container memiliki tinggi (height) sebesar 180 pixel dan lebar (width) menggunakan double.infinity, sehingga lebar container akan menyesuaikan dan memenuhi area layar yang tersedia secara horizontal.

2. Dekorasi Container (decoration: BoxDecoration)
<br>Tampilan visual container diatur menggunakan BoxDecoration, yang terdiri dari beberapa elemen berikut :
    - Gradasi Warna (LinearGradient); Background container menggunakan efek gradasi warna melalui LinearGradient, yaitu perpaduan warna dari biru tua (Colors.indigo) menuju biru muda (Colors.lightBlue). Efek ini membuat tampilan container terlihat lebih modern dan tidak monoton.
    - Sudut Melengkung (borderRadius); Properti borderRadius: BorderRadius.circular(24) digunakan untuk membuat sudut container menjadi melengkung dengan radius sebesar 24 pixel. Hal ini memberikan kesan lebih halus dan elegan dibandingkan sudut kotak biasa.
    - Efek Bayangan (boxShadow); Container juga diberikan efek bayangan menggunakan BoxShadow. Bayangan berwarna Colors.indigo dengan tingkat blur (blurRadius) sebesar 12 dan posisi bayangan sedikit bergeser ke bawah menggunakan offset: Offset(0, 6). Efek ini membuat container terlihat lebih hidup dan memiliki dimensi seperti kartu (card).

3. Isi Container (child)
<br>Seluruh isi container dibungkus menggunakan widget Center, sehingga seluruh komponen di dalamnya berada tepat di tengah container, baik secara horizontal maupun vertikal.

4. Pengaturan Layout Menggunakan Column
<br>Di dalam Center, digunakan widget Column dengan properti mainAxisAlignment: MainAxisAlignment.center. Pengaturan ini membuat seluruh elemen tersusun secara vertikal dari atas ke bawah dan posisinya tetap berada di tengah container.

5. Komponen yang Ditampilkan
<br>Beberapa widget yang terdapat di dalam Column antara lain :
    - Icon; Widget Icon(Icons.computer) digunakan untuk menampilkan ikon komputer dengan warna putih (Colors.white) dan ukuran (size) sebesar 38.
    - SizedBox; Widget SizedBox(height: 8) dan SizedBox(height: 4) digunakan sebagai pemberi jarak antar elemen agar tampilan tidak terlalu rapat dan terlihat lebih rapi.
    - Text Nama; Widget Text pertama digunakan untuk menampilkan nama "Muhammad Dhimas Hafizh Fathurrahman". Teks ditampilkan rata tengah (textAlign: TextAlign.center), berwarna putih, memiliki ukuran font 19, serta menggunakan fontWeight.bold agar terlihat lebih tegas dan menonjol.
    - Text NIM; Widget Text kedua digunakan untuk menampilkan NIM "2311102151" dengan ukuran font 15 dan warna Colors.white70, sehingga tampil sedikit lebih transparan dibandingkan teks nama.

#### 2. GridView
GridView merupakan widget pada Flutter yang digunakan untuk menampilkan data dalam bentuk grid atau kisi-kisi (baris dan kolom). Widget ini sangat cocok digunakan untuk menampilkan menu layanan, kategori, galeri foto, maupun daftar produk. Pada kode main.dart, digunakan GridView.builder karena lebih efisien dalam me-render data secara dinamis dari sebuah list atau array (gridItems).

Berikut penjelasan Widget GridView yang digunakan pada main.dart : 

1. Pengaturan Scroll GridView
<br>Karena GridView diletakkan di dalam widget yang sudah memiliki scroll utama, maka diperlukan beberapa pengaturan agar tidak terjadi konflik scroll.
    - shrinkWrap: true; Properti ini digunakan agar tinggi GridView menyesuaikan jumlah item yang ada di dalamnya. Tanpa properti ini, GridView bisa mengalami error karena mencoba mengambil tinggi tak terbatas.
    - physics: NeverScrollableScrollPhysics(); Digunakan untuk menonaktifkan scroll bawaan dari GridView. Dengan begitu, proses scroll hanya dikendalikan oleh scroll utama halaman sehingga lebih stabil dan tidak terjadi bentrok antar scroll.

2. Pengaturan Tata Letak Grid (gridDelegate)
<br>Layout grid diatur menggunakan SliverGridDelegateWithFixedCrossAxisCount, yang berfungsi menentukan jumlah kolom dan jarak antar item.
    - crossAxisCount: 2; Membagi tampilan grid menjadi 2 kolom dalam satu baris
    - crossAxisSpacing: 14; Memberikan jarak horizontal antar kotak grid sebesar 14 pixel
    - mainAxisSpacing: 14; Memberikan jarak vertikal antar kotak grid sebesar 14 pixel sehingga tampilan lebih rapi dan tidak terlalu rapat
    - childAspectRatio: 1.1; Mengatur perbandingan lebar dan tinggi item grid. Nilai 1.1 membuat ukuran kotak sedikit lebih lebar dibandingkan tingginya

3. Pembuatan Item Secara Dinamis (itemBuilder)
<br>Widget itemBuilder digunakan untuk membuat isi grid secara otomatis berdasarkan jumlah data pada gridItems.
    - itemCount: gridItems.length; Menentukan jumlah item yang akan ditampilkan sesuai panjang data pada array gridItems
    - final item = gridItems[index]; Pada setiap perulangan, variabel item akan mengambil data tertentu dari array berdasarkan index saat ini, seperti warna, icon, dan judul layanan

4. Desain Item Grid Menggunakan Container
<br>Setiap item grid dibungkus menggunakan widget Container yang diberikan dekorasi visual agar tampil lebih menarik.
    - Background Warna Dinamis; Properti color: item['color'] membuat setiap kotak memiliki warna berbeda sesuai data pada array
    - Sudut Melengkung (borderRadius); Menggunakan BorderRadius.circular(22) agar sudut kotak terlihat lebih halus dan modern.
    - Efek Bayangan (boxShadow); Setiap kotak memiliki efek bayangan dengan warna yang mengikuti warna utama kotak (item['color'].withOpacity(0.35)), sehingga tampilan terlihat lebih hidup dan memiliki dimensi.

5. Isi Item Grid (child)
<br>Di dalam Container, digunakan widget Column dengan mainAxisAlignment: MainAxisAlignment.center agar seluruh isi berada tepat di tengah kotak secara vertikal. Komponen yang ditampilkan antara lain:
    - Icon; Widget Icon digunakan untuk menampilkan ikon layanan berdasarkan data item['icon']. Ikon berwarna putih dengan ukuran 42 agar terlihat jelas dan dominan.
    - SizedBox; SizedBox(height: 10) digunakan sebagai jarak antara icon dan text agar tampilan tidak terlalu rapat.
    - Text judul layanan; Widget Text digunakan untuk menampilkan nama layanan dari item['title']. Teks berwarna putih, memiliki ukuran font 18, dan menggunakan fontWeight.bold agar lebih mudah dibaca.

#### 3. ListView
ListView merupakan widget pada Flutter yang digunakan untuk menampilkan kumpulan widget dalam bentuk daftar secara vertikal maupun horizontal yang dapat di-scroll. Widget ini sangat sering digunakan untuk menampilkan data seperti daftar menu, notifikasi, chat, maupun status proses tertentu. Pada kode main.dart, ListView digunakan untuk menampilkan daftar tahapan status perbaikan perangkat yang disusun secara vertikal.

Berikut penjelasan Widget ListView yang digunakan pada main.dart : 

1. Pembatas Tinggi Menggunakan SizedBox
<br>Widget ListView dibungkus menggunakan SizedBox dengan properti height: 180. Penggunaan SizedBox ini bertujuan untuk memberikan batas tinggi yang pasti pada area ListView. Hal ini penting karena ListView memiliki sifat scrollable, sehingga jika ditempatkan di dalam widget vertikal seperti Column, maka perlu diberikan batas ukuran agar tidak terjadi error layout. Dengan tinggi sebesar 180 pixel, area list akan tetap rapi dan bisa di-scroll apabila jumlah item melebihi ukuran tersebut.

2. Penggunaan Widget ListView
<br>ListView pada kode ini digunakan dalam bentuk standar menggunakan properti children. Karena jumlah data sedikit dan bersifat statis (tidak berubah-ubah), maka penggunaan children lebih sederhana dibandingkan menggunakan ListView.builder. Seluruh item list dituliskan langsung di dalam children tanpa perlu melakukan looping atau pengambilan data secara dinamis.

3. Isi Daftar (children)
<br>Di dalam ListView, terdapat beberapa item status perbaikan yang ditampilkan menggunakan widget custom bernama CustomTile. Item yang ditampilkan antara lain :
    - CustomTile('Pengecekan Masalah', Icons.search); Menampilkan status pengecekan awal perangkat dengan ikon pencarian (Icons.search).
    - CustomTile('Sedang Diperbaiki', Icons.build_circle); Menampilkan status perangkat yang sedang dalam proses perbaikan dengan ikon tools/perbaikan (Icons.build_circle).
    - CustomTile('Perangkat Siap Diambil', Icons.check_circle_outline); Menampilkan status akhir bahwa perangkat telah selesai diperbaiki dan siap diambil, menggunakan ikon centang (Icons.check_circle_outline).

4. Penggunaan Widget Custom (CustomTile)
<br>Untuk menjaga struktur kode tetap rapi dan reusable, setiap item list dibuat menggunakan widget custom bernama CustomTile. Dengan cara ini, desain item tidak perlu ditulis berulang kali. Kita hanya perlu mengirim parameter berupa teks status dan ikon yang ingin ditampilkan. Pendekatan ini membuat kode lebih modular, mudah dibaca, dan lebih mudah dikembangkan apabila tampilan item ingin diubah di kemudian hari.

#### 4. ListView.builder
ListView.builder merupakan versi dinamis dari ListView yang digunakan untuk menampilkan daftar data dalam jumlah banyak secara lebih efisien. Berbeda dengan ListView biasa yang menampilkan seluruh item sekaligus, ListView.builder hanya akan me-render item yang sedang terlihat di layar (lazy loading). Karena itu, widget ini sangat cocok digunakan untuk data yang jumlahnya banyak atau bersifat dinamis. Pada kode main.dart, ListView.builder digunakan untuk menampilkan daftar paket layanan IT berdasarkan data dari array layananIT.

Berikut penjelasan Widget ListView.builder yang digunakan pada main.dart : 

1. Pembatas Tinggi Menggunakan SizedBox
<br>Widget ListView.builder dibungkus menggunakan SizedBox(height: 260). Tujuannya adalah untuk memberikan batas tinggi yang jelas pada area list. Karena widget ini berada di dalam layout vertikal, maka ListView perlu diberi ukuran tertentu agar tidak terjadi error overflow atau unbounded height. Dengan tinggi sebesar 260 pixel, daftar paket IT dapat di-scroll secara vertikal di dalam area tersebut.

2. Jumlah Data (itemCount)
<br>Properti itemCount: layananIT.length digunakan untuk menentukan jumlah item yang akan dibuat. Nilai ini diambil langsung dari panjang array layananIT. Dengan begitu, jumlah item akan otomatis menyesuaikan banyaknya data yang tersedia tanpa perlu ditulis satu per satu secara manual.

3. Pembuatan Item Secara Dinamis (itemBuilder)
<br>Properti itemBuilder berfungsi untuk membuat tampilan item secara otomatis melalui proses perulangan (looping). Pada setiap perulangan, Flutter akan menyediakan index yang dimulai dari angka 0. Nilai index ini digunakan untuk mengambil data tertentu dari array layananIT[index].

4. Desain Item Menggunakan Card
<br>Setiap item list dibungkus menggunakan widget Card agar tampil seperti kartu modern. Properti shape: RoundedRectangleBorder(...) digunakan untuk membuat sudut kartu menjadi melengkung. BorderRadius.circular(16) memberikan radius sudut sebesar 16 pixel, sehingga tampilan card terlihat lebih halus dan elegan.

5. Isi Item Menggunakan ListTile
<br>Di dalam Card, digunakan widget ListTile yang memudahkan penyusunan layout list menjadi lebih rapi dan terstruktur. Bagian-bagian pada ListTile terdiri dari :
    - leading (Bagian Kiri); Menggunakan widget CircleAvatar dengan warna latar Colors.indigo. Di dalamnya terdapat angka nomor urut yang diambil dari ${index + 1}. Karena index dimulai dari 0, maka ditambahkan +1 agar nomor yang tampil dimulai dari angka 1.
    - title (Judul Utama); Menampilkan nama paket layanan dari array layananIT[index]. Teks dibuat lebih menonjol menggunakan fontWeight: FontWeight.bold.
    - subtitle (Deskripsi Tambahan); menampilkan teks 'Tersedia untuk perorangan & instansi' sebagai informasi tambahan mengenai layanan yang tersedia.
    - trailing (Bagian Kanan); Menggunakan ikon Icons.arrow_forward_ios dengan ukuran 16, yang memberikan kesan bahwa item tersebut dapat dibuka atau memiliki detail lanjutan.

#### 5. ListView.separated
ListView.separated merupakan pengembangan dari ListView.builder yang memiliki fitur tambahan berupa pemisah otomatis antar item. Widget ini sangat cocok digunakan ketika ingin menampilkan daftar data yang memiliki garis pembatas (divider) atau jarak antar item tanpa perlu menambahkannya secara manual di dalam itemBuilder. Pada kode main.dart, ListView.separated digunakan untuk menampilkan detail layanan IT secara dinamis berdasarkan data dari array layananIT, sekaligus menambahkan garis pemisah otomatis di antara setiap item list. 

Berikut penjelasan Widget ListView.separated yang digunakan pada main.dart : 

1. Pembatas Tinggi Menggunakan SizedBox
<br>Widget ListView.separated dibungkus menggunakan SizedBox(height: 230). Tujuannya adalah untuk memberikan batas tinggi pada area list agar tetap terkontrol di dalam layout halaman. Karena ListView bersifat scrollable, maka perlu diberikan ukuran tinggi yang jelas agar tidak terjadi masalah layout seperti overflow. Dengan tinggi sebesar 230 pixel, daftar layanan dapat di-scroll secara vertikal di dalam area tersebut.

2. Jumlah Data (itemCount)
<br>Properti itemCount: layananIT.length digunakan untuk menentukan jumlah item yang akan ditampilkan. Jumlah item otomatis mengikuti panjang data dari array layananIT. Dengan cara ini, list dapat bertambah atau berkurang secara dinamis sesuai isi data.

3. Pemisah Antar Item (separatorBuilder)
<br>Fitur ini adalah fitur yang membedakan Listview.separated dengan ListView.builder. separatorBuilder digunakan untuk membuat widget pemisah di antara item list. Pada kode ini, digunakan widget :
```dart
Divider(
  thickness: 1.2,
  color: Colors.indigoAccent,
)
```
sehingga setiap item dipisahkan menggunakan garis horizontal berwarna biru aksen (Colors.indigoAccent) dengan ketebalan 1.2 pixel. Dengan adanya separator otomatis, tampilan list menjadi lebih rapi dan mudah dibaca tanpa perlu menambahkan divider secara manual pada setiap item.

4. Pembuatan Item Secara Dinamis (itemBuilder)
<br>Sama seperti ListView.builder, bagian itemBuilder digunakan untuk membangun item list secara otomatis berdasarkan index data. Flutter akan melakukan looping sesuai jumlah itemCount. Pada setiap perulangan, data layanan diambil dari layananIT[index]

5. Desain Isi List Menggunakan ListTile
<br>Setiap item ditampilkan menggunakan widget ListTile agar susunan layout lebih praktis dan terstruktur. Bagian-bagian ListTile terdiri dari:
    - leading (Bagian Kiri); menggunakan ikon Icons.settings_ethernet dengan warna Colors.indigoAccent. Ikon ini memberikan kesan bahwa item berkaitan dengan layanan jaringan atau teknologi.
    - title (Judul Utama); Menampilkan nama layanan menggunakan interpolasi string Layanan: ${layananIT[index]}. Teks dibuat sedikit lebih tebal menggunakan fontWeight: FontWeight.w600 agar terlihat lebih jelas dan menonjol.
    - subtitle (Deskripsi Tambahan); menampilkan teks 'Pengerjaan cepat dan bergaransi' sebagai informasi tambahan mengenai kualitas layanan.
    - trailing (Bagian Kanan); menggunakan ikon Icons.verified dengan warna hijau (Colors.green) untuk memberikan kesan terpercaya, profesional, dan bergaransi.

#### 6. Stack
Stack merupakan widget pada Flutter yang digunakan untuk menumpuk beberapa widget dalam satu area yang sama, mirip seperti sistem layer atau tumpukan pada aplikasi desain. Widget pertama yang ditulis di dalam children akan berada di lapisan paling bawah, sedangkan widget berikutnya akan ditampilkan di atasnya. Widget ini sangat cocok digunakan untuk membuat tampilan UI yang saling bertumpuk (overlay) seperti banner promo, badge notifikasi, floating element, maupun desain card modern. Pada kode main.dart, Stack digunakan untuk membuat banner promo servis dengan kombinasi beberapa kotak ikon yang saling menindih dan teks promosi yang ditempatkan secara presisi.

Berikut penjelasan Widget stack yang digunakan pada main.dart :

1. Container Utama Sebagai Area Stack
<br>Seluruh elemen Stack dibungkus menggunakan widget Container sebagai area utama. 
    - height: 180 digunakan untuk menentukan tinggi banner sebesar 180 pixel. 
    - width: double.infinity membuat lebar container memenuhi area horizontal yang tersedia.
    - Pada bagian decoration, digunakan color: Colors.indigo.shade100 untuk memberikan warna dasar biru muda. Properti borderRadius: BorderRadius.circular(24) digunakan agar sudut banner terlihat melengkung dan lebih modern.

2. Penggunaan Widget Stack
<br>Widget Stack memungkinkan setiap elemen ditempatkan pada posisi tertentu menggunakan widget Positioned. Dengan pendekatan ini, setiap komponen dapat diatur koordinatnya secara bebas. Hasilnya, elemen-elemen dapat saling bertumpuk sehingga tampilan menjadi lebih dinamis dan menarik secara visual.

3. Layer Pertama (Kotak Background Utama)
<br>Widget pertama di dalam children akan menjadi layer paling bawah. Menggunakan :
```dart
Positioned(
  top: 25,
  left: 25,
)
```
sehingga kotak ditempatkan sejauh 25 pixel dari atas dan kiri container. Di dalamnya terdapat Container berukuran width: 110, height: 110. Warna kotak menggunakan Colors.indigo dengan sudut melengkung (BorderRadius.circular(22)). Pada bagian tengah kotak terdapat ikon Icons.settings_suggest berwarna putih dengan ukuran 50. Kotak ini berfungsi sebagai elemen visual utama pada banner.

4. Layer Kedua (Kotak Overlay)
<br>Widget kedua juga menggunakan Positioned, namun dengan posisi berbeda top: 55, left: 95. Posisi ini membuat kotak kedua sedikit bergeser ke kanan bawah sehingga menumpuk sebagian area kotak pertama. Efek overlap inilah yang menjadi ciri utama penggunaan Stack. Kotak kedua memiliki ukuran 110 x 110, warna Colors.lightBlueAccent, sudut melengkung radius 22, serta ikon Icons.speed berwarna putih dengan ukuran 48. Kombinasi warna dan posisi bertumpuk membuat tampilan banner terlihat lebih modern dan interaktif.

5. Layer Ketiga (Teks Promo)
<br>Widget terakhir berada pada layer paling atas karena ditulis paling akhir di dalam children. Menggunakan :
```dart
Positioned(
  bottom: 28,
  right: 24,
)
```
sehingga teks ditempatkan di area kanan bawah banner. Teks yang ditampilkan adalah 'Fast & Reliable'. Teks dibuat lebih menonjol menggunakan fontSize: 26, fontWeight: FontWeight.bold. Warna teks menggunakan Colors.indigo agar tetap selaras dengan tema warna banner.