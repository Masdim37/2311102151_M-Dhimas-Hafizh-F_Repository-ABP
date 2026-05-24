class Mahasiswa {
  String nama;
  String nim;
  String jurusan;
  double ipk; // Di Dart, tipe bilangan desimal (Float) menggunakan double
  DateTime tgllahir;
  bool gender; // true = Laki-laki, false = Perempuan

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.ipk,
    required this.tgllahir,
    required this.gender,
  });
}
