import 'package:flutter/material.dart';
import 'model_mahasiswa.dart';

class StatistikPage extends StatefulWidget {
  final List<Mahasiswa> data;
  const StatistikPage({super.key, required this.data});

  @override
  State<StatistikPage> createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> {
  String? _selectedJurusan;

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
    _selectedJurusan = _daftarJurusan[0];
  }

  @override
  Widget build(BuildContext context) {
    //Mengambil data global (Data mahasiswa dari semua jurusan)
    int totalGlobal = widget.data.length; //data total mahasiswa
    double rataIpkGlobal =
        totalGlobal ==
            0 //data rata-rata IPK
        ? 0
        : widget.data.map((m) => m.ipk).reduce((a, b) => a + b) / totalGlobal;

    //mengambil data sesuai filter jurusan yang dipilih
    List<Mahasiswa> dataFilter = widget.data
        .where((m) => m.jurusan == _selectedJurusan)
        .toList();

    int totalFilter = dataFilter.length; //data jumlah mahasiswa
    int lakiLaki = dataFilter
        .where((m) => m.gender)
        .length; //data jumlah mahasiswa laki-laki
    int perempuan = totalFilter - lakiLaki; //data jumlah mahasiswa perempuan
    double rataIpkFilter =
        totalFilter ==
            0 //data rata-rata IPK
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
            //bagian ringkasan data global
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

            //bagian data sesuai filter jurusan
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
    );
  }

  //widget untuk data sesuai filter jurusan
  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
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

  //widget kecil untuk data global
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
