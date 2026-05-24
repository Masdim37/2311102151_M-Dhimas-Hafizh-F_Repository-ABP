import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'model_mahasiswa.dart';
import 'main.dart';

class CrudMahasiswaPage extends StatefulWidget {
  final List<Mahasiswa> data;
  const CrudMahasiswaPage({super.key, required this.data});

  @override
  State<CrudMahasiswaPage> createState() => _CrudMahasiswaPageState();
}

class _CrudMahasiswaPageState extends State<CrudMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _ipkController = TextEditingController();

  String? _jurusanTerpilih;
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

  DateTime? _tglLahirTerpilih;
  bool _genderTerpilih = true;

  // FUNGSI UTAMA: Memunculkan Notifikasi & Mencatat ke Riwayat Log
  Future<void> _tampilkanNotifikasi(String judul, String pesan) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'crud_channel',
          'Notifikasi CRUD',
          importance: Importance.max,
          priority: Priority.high,
        );
    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    // 1. Tembakkan notifikasi ke sistem bar Android
    await flutterLocalNotificationsPlugin.show(
      id:
          DateTime.now().millisecondsSinceEpoch ~/
          1000, // ID unik berbasis waktu
      title: judul,
      body: pesan,
      notificationDetails: platformDetails,
    );

    // 2. Tambahkan ke Log Riwayat (Menu Kedua)
    String waktu =
        "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";
    logNotifikasi.insert(
      0,
      "[$waktu] $judul: $pesan",
    ); // Menyisipkan log baru di urutan paling atas
  }

  // DIALOG FORM (Mendukung Tambah & Edit Data)
  void _tampilFormDialog({int? index}) {
    if (index != null) {
      // MODE EDIT: Isi form dengan data lama yang dipilih
      _namaController.text = widget.data[index].nama;
      _nimController.text = widget.data[index].nim;
      _ipkController.text = widget.data[index].ipk.toString();
      _jurusanTerpilih = widget.data[index].jurusan;
      _tglLahirTerpilih = widget.data[index].tgllahir;
      _genderTerpilih = widget.data[index].gender;

      // SOLUSI: Mengarahkan kursor ke akhir karakter (Bukan nge-blok)
      _namaController.selection = TextSelection.fromPosition(
        TextPosition(offset: _namaController.text.length),
      );
      _nimController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nimController.text.length),
      );
      _ipkController.selection = TextSelection.fromPosition(
        TextPosition(offset: _ipkController.text.length),
      );
    } else {
      // MODE CREATE: Kosongkan Form
      _namaController.clear();
      _nimController.clear();
      _ipkController.clear();
      _jurusanTerpilih = null;
      _tglLahirTerpilih = null;
      _genderTerpilih = true;
    }

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(
            index == null ? 'Tambah Mahasiswa' : 'Edit Mahasiswa',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                    ),
                    validator: (val) => val!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  TextFormField(
                    controller: _nimController,
                    decoration: const InputDecoration(labelText: 'NIM'),
                    keyboardType: TextInputType.number,
                    validator: (val) => val!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  DropdownButtonFormField<String>(
                    value: _jurusanTerpilih,
                    decoration: const InputDecoration(
                      labelText: 'Program Studi',
                    ),
                    items: _daftarJurusan
                        .map((j) => DropdownMenuItem(value: j, child: Text(j)))
                        .toList(),
                    onChanged: (val) =>
                        setDialogState(() => _jurusanTerpilih = val),
                    validator: (val) => val == null ? 'Pilih jurusan' : null,
                  ),
                  TextFormField(
                    controller: _ipkController,
                    decoration: const InputDecoration(labelText: 'IPK'),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (val) => val!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _tglLahirTerpilih == null
                              ? 'Tanggal Lahir'
                              : 'Tanggal Lahir: ${_tglLahirTerpilih!.day}/${_tglLahirTerpilih!.month}/${_tglLahirTerpilih!.year}',
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _tglLahirTerpilih ?? DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null)
                            setDialogState(() => _tglLahirTerpilih = picked);
                        },
                        child: const Text('Pilih'),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jenis Kelamin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _genderTerpilih,
                        onChanged: (val) =>
                            setDialogState(() => _genderTerpilih = val!),
                      ),
                      const Text('Laki-laki'),
                      Radio<bool>(
                        value: false,
                        groupValue: _genderTerpilih,
                        onChanged: (val) =>
                            setDialogState(() => _genderTerpilih = val!),
                      ),
                      const Text('Perempuan'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    _tglLahirTerpilih != null) {
                  setState(() {
                    final mhsBaru = Mahasiswa(
                      nama: _namaController.text,
                      nim: _nimController.text,
                      jurusan: _jurusanTerpilih!,
                      ipk: double.parse(_ipkController.text),
                      tgllahir: _tglLahirTerpilih!,
                      gender: _genderTerpilih,
                    );

                    if (index == null) {
                      // AKSI: CREATE DATA
                      widget.data.add(mhsBaru);
                      _tampilkanNotifikasi(
                        "Data Berhasil Ditambah!",
                        "Mahasiswa ${_namaController.text} ditambahkan.",
                      );
                    } else {
                      // AKSI: EDIT / UPDATE DATA
                      widget.data[index] = mhsBaru;
                      _tampilkanNotifikasi(
                        "Data Berhasil Diperbarui!",
                        "Data ${_namaController.text} telah diubah.",
                      );
                    }
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  // FUNGSI AKSI: DELETE (HAPUS DATA)
  void _hapusData(int index) {
    String namaDihapus = widget.data[index].nama;
    setState(() {
      widget.data.removeAt(index);
    });
    // Pemicu Notifikasi saat data didelete
    _tampilkanNotifikasi(
      "Data Dihapus",
      "Data mahasiswa bernama $namaDihapus dihapus dari sistem.",
    );
  }

  // FUNGSI BARU: Dialog Konfirmasi Sebelum Hapus
  void _konfirmasiHapus(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 10),
            Text('Konfirmasi Hapus'),
          ],
        ),
        content: Text(
          'Apakah Anda yakin ingin menghapus data dari mahasiswa bernama ${widget.data[index].nama}?',
        ),
        actions: [
          // Pilihan 1: Batal (Tutup dialog tanpa menghapus)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          // Pilihan 2: Ya (Tutup dialog lalu jalankan proses hapus)
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context); // Tutup dialog konfirmasi terlebih dahulu
              _hapusData(index); // Jalankan fungsi hapus data & notifikasi
            },
            child: const Text(
              'Ya, Hapus',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Mahasiswa',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: widget.data.isEmpty
          ? const Center(child: Text('Belum ada data mahasiswa.'))
          : ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                final mhs = widget.data[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.people),
                    title: Text(
                      mhs.nama,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('NIM : ${mhs.nim}'),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail', arguments: mhs);
                    },
                    // MENAMPILKAN TOMBOL EDIT & DELETE DI KANAN
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _tampilFormDialog(index: index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _konfirmasiHapus(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tampilFormDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
