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
<a href="https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-8">
    https://github.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/tree/master/Pertemuan-8 
</a>

## TUGAS PERTEMUAN 9 MOBILE
📝 Tugas Praktikum Modul 4-5 Flutter

Buat 1 project Flutter yang menampilkan beberapa widget UI berikut:
🔹 Yang harus ada:
Container → kotak berwarna
GridView → minimal 6 item (grid)
ListView → 3 item (A, B, C)
ListView.builder → list dari data array
ListView.separated → list + garis pembatas
Stack → tampilan bertumpuk (kotak / text)

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
![Screenshot Output 1](https://raw.githubusercontent.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/master/Pertemuan-9/ScreenshotOutput/1.png)

![Screenshot Output 2](https://raw.githubusercontent.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/master/Pertemuan-9/ScreenshotOutput/2.png)

![Screenshot Output 3](https://raw.githubusercontent.com/Masdim37/2311102151_M-Dhimas-Hafizh-F_Repository-ABP/master/Pertemuan-9/ScreenshotOutput/3.png)

### Penjelasan Setiap Widget

#### 1. Container

#### 2. GridView

#### 3. ListView

#### 4. ListView.builded

#### 5. ListView.separated

#### 6. Stack