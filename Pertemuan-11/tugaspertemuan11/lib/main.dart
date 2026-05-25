import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'crud_page.dart';
import 'detail_page.dart';
import 'model_mahasiswa.dart';
import 'statistik_page.dart';

//Deklarasi Variabel Global yang dapat diakses oleh file lain
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final List<String> logNotifikasi = []; //List penyimpan log riwayat aktivitas
final List<Mahasiswa> dataMahasiswa =
    []; //List dataMahasiswa untuk menyimpan data mahasiswa

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(
    settings: initializationSettings,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD & Notification Log',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        //routing halaman
        '/': (context) => const MainNavigation(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          CrudMahasiswaPage(
            data: dataMahasiswa,
          ), //kirim dataMahasiswa ke halaman crud
          RiwayatLogPage(),
          StatistikPage(
            data: dataMahasiswa,
          ), //kirim dataMahasiswa ke halaman statistik
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Mahasiswa'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Statistik',
          ),
        ],
      ),
    );
  }
}

//WIDGET HALAMAN MENU KEDUA: LOG RIWAYAT NOTIFIKASI
class RiwayatLogPage extends StatelessWidget {
  const RiwayatLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Aktivitas',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: logNotifikasi.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history_toggle_off, size: 60, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    'Belum ada riwayat aktivitas sistem.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: logNotifikasi.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.circle_notifications,
                      color: Colors.amber,
                    ),
                    title: Text(
                      logNotifikasi[index],
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
