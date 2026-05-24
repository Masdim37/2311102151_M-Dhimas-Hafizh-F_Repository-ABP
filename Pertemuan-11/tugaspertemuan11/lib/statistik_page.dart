import 'package:flutter/material.dart';
import 'model_mahasiswa.dart';

class StatistikPage extends StatefulWidget {
  final List<Mahasiswa> data;
  const StatistikPage({super.key, required this.data});

  @override
  State<StatistikPage> createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> {
  // Variabel state untuk menyimpan jurusan yang sedang dipilih
  String? _selectedJurusan;

  // Daftar jurusan yang sama dengan yang ada di crud_page.dart
  final List<String> _daftarJurusan = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Software Engineering',
    'Sains Data',
    'Teknik Telekomunikasi',
    'Teknik Elektro',
    'Teknik Biomedis',
    'Teknik Industri',
    'Teknik Logistik',
    'Desain Komunikasi Visual',
    'Desain Produk',
    'Teknologi Pangan',
  ];

  @override
  void initState() {
    super.initState();
    // Mengeset default pilihan pertama (Informatika) saat halaman dibuka
    _selectedJurusan = _daftarJurusan[0];
  }

  @override
  Widget build(BuildContext context) {
    // 1. DATA GLOBAL (Semua Jurusan)
    int totalGlobal = widget.data.length;
    double rataIpkGlobal = totalGlobal == 0
        ? 0
        : widget.data.map((m) => m.ipk).reduce((a, b) => a + b) / totalGlobal;

    // 2. DATA FILTER (Sesuai Dropdown)
    List<Mahasiswa> dataFilter = widget.data
        .where((m) => m.jurusan == _selectedJurusan)
        .toList();

    int totalFilter = dataFilter.length;
    int lakiLaki = dataFilter.where((m) => m.gender).length;
    int perempuan = totalFilter - lakiLaki;
    double rataIpkFilter = totalFilter == 0
        ? 0
        : dataFilter.map((m) => m.ipk).reduce((a, b) => a + b) / totalFilter;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Statistik Mahasiswa",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BAGIAN RINGKASAN GLOBAL
            const Text(
              "Ringkasan Global",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: _buildStatCardSmall(
                    "Total Mahasiswa",
                    "$totalGlobal",
                    Icons.group,
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildStatCardSmall(
                    "Rata-Rata IPK",
                    rataIpkGlobal.toStringAsFixed(2),
                    Icons.school,
                    Colors.orange,
                  ),
                ),
              ],
            ),
            const Divider(height: 40),

            // BAGIAN FILTER JURUSAN
            const Text(
              "Filter Program Studi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedJurusan,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.category),
              ),
              items: _daftarJurusan
                  .map((j) => DropdownMenuItem(value: j, child: Text(j)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedJurusan = val!),
            ),

            const SizedBox(height: 20),
            _buildStatCard(
              "Jumlah Mahasiswa",
              "$totalFilter",
              Icons.people,
              Colors.blue,
            ),
            _buildStatCard(
              "Laki-Laki",
              "$lakiLaki",
              Icons.male,
              Colors.lightBlue,
            ),
            _buildStatCard(
              "Perempuan",
              "$perempuan",
              Icons.female,
              Colors.pink,
            ),
            _buildStatCard(
              "Rata-Rata IPK",
              rataIpkFilter.toStringAsFixed(2),
              Icons.school,
              Colors.orange,
            ),
          ],
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     // children: [
      //     // _buildStatCard(
      //     //   "Total Mahasiswa",
      //     //   "$total",
      //     //   Icons.group,
      //     //   Colors.blue,
      //     // ),
      //     // _buildStatCard(
      //     //   "Rata-rata IPK",
      //     //   rataIpk.toStringAsFixed(2),
      //     //   Icons.school,
      //     //   Colors.orange,
      //     // ),
      //     // ],
      //     children: [
      //       // 1. WIDGET DROPDOWN PEMILIHAN JURUSAN (Materi Modul 6)
      //       DropdownButtonFormField<String>(
      //         value: _selectedJurusan,
      //         decoration: const InputDecoration(
      //           labelText: 'Filter Berdasarkan Jurusan',
      //           border: OutlineInputBorder(),
      //           prefixIcon: Icon(Icons.category),
      //         ),
      //         items: _daftarJurusan
      //             .map((j) => DropdownMenuItem(value: j, child: Text(j)))
      //             .toList(),
      //         onChanged: (val) {
      //           setState(() {
      //             _selectedJurusan =
      //                 val; // Memicu rebuild data statistik di bawah
      //           });
      //         },
      //       ),
      //       const SizedBox(height: 25),

      //       Text(
      //         "Persebaran Data Jurusan $_selectedJurusan:",
      //         style: const TextStyle(
      //           fontSize: 15,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.grey,
      //         ),
      //       ),
      //       const SizedBox(height: 10),

      //       // 2. DAFTAR KARTU INFORMASI SEBARAN DATA (Materi Modul 7 - Model Processing)
      //       _buildStatCard(
      //         "Total Mahasiswa",
      //         "$total",
      //         Icons.group,
      //         Colors.blue,
      //       ),
      //       _buildStatCard(
      //         "Laki-laki",
      //         "$lakiLaki",
      //         Icons.male,
      //         Colors.lightBlue,
      //       ),
      //       _buildStatCard(
      //         "Perempuan",
      //         "$perempuan",
      //         Icons.female,
      //         Colors.pink,
      //       ),
      //       _buildStatCard(
      //         "Rata-rata IPK",
      //         rataIpk.toStringAsFixed(2),
      //         Icons.school,
      //         Colors.orange,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ), // Menambahkan jarak antar card
      child: ListTile(
        leading: Icon(icon, color: color, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Tambahan: Widget khusus untuk kartu kecil di bagian atas (Ringkasan Global)
  Widget _buildStatCardSmall(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, color: color),
            Text(title, style: const TextStyle(fontSize: 12)),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
