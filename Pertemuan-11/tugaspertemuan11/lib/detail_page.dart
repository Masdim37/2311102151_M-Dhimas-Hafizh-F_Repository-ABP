import 'package:flutter/material.dart';
import 'model_mahasiswa.dart'; // Import model

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menangkap data (object) yang dikirim melalui argumen rute
    final Mahasiswa mhs =
        ModalRoute.of(context)!.settings.arguments as Mahasiswa;

    // Logika mengubah boolean gender menjadi teks
    String genderTeks = mhs.gender ? "Laki-laki" : "Perempuan";
    // Format tanggal lahir sederhana
    String tglLahirTeks =
        "${mhs.tgllahir.day}-${mhs.tgllahir.month}-${mhs.tgllahir.year}";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Mahasiswa',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Sesuaikan tinggi dengan isi
              children: [
                // const Text(
                //   "Informasi Lengkap",
                //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                // ),
                // const Divider(),
                const SizedBox(height: 10),
                Text(
                  'Nama Mahasiswa : ${mhs.nama}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text('NIM : ${mhs.nim}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  'Program Studi : ${mhs.jurusan}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text('IPK : ${mhs.ipk}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  'Tanggal Lahir : $tglLahirTeks',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Jenis Kelamin : $genderTeks',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
