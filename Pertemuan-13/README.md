# Laporan Singkat Implementasi Provider dan Notifikasi pada Flutter

## Cara Kerja Provider pada Aplikasi

Aplikasi ini menggunakan package **Provider** sebagai state management untuk mengelola nilai counter. Nilai counter disimpan pada kelas `CounterProvider` yang mengimplementasikan `ChangeNotifier`. Ketika tombol **Tambah (+)** ditekan, method `increment()` akan menambah nilai counter sebesar 1. Setelah nilai berubah, method `notifyListeners()` dipanggil sehingga seluruh widget yang menggunakan data counter akan diperbarui secara otomatis tanpa perlu menggunakan `setState()`.

Pada file `main.dart`, `CounterProvider` didaftarkan menggunakan `ChangeNotifierProvider` sehingga dapat diakses oleh seluruh widget dalam aplikasi. Nilai counter ditampilkan menggunakan `context.watch<CounterProvider>()`, sedangkan proses penambahan counter dilakukan melalui `context.read<CounterProvider>().increment()`.

## Cara Kerja Notifikasi yang Digunakan

Aplikasi ini menggunakan package **flutter_local_notifications** untuk menampilkan notifikasi lokal pada perangkat Android. Sebelum digunakan, notifikasi diinisialisasi melalui method `NotificationService.init()` yang juga meminta izin notifikasi kepada pengguna.

Setiap kali tombol **Tambah (+)** ditekan, method `increment()` pada `CounterProvider` akan memanggil `NotificationService.show(counter)`. Method tersebut membuat dan menampilkan notifikasi dengan judul **"Counter Update"** serta pesan **"Nilai counter saat ini: X"**, di mana X merupakan nilai counter terbaru. Dengan demikian, setiap perubahan nilai counter akan langsung diinformasikan kepada pengguna melalui notifikasi lokal.
