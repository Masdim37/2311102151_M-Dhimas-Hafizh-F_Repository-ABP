// === MAIN 7 (Aplikasi Gabungan) ===
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AplikasiGabungan());
}

class AplikasiGabungan extends StatelessWidget {
  const AplikasiGabungan({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Menu & Tombol',
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _selectedIndex = 0;

  String selectedValue = 'Pilihan 1';

  @override
  Widget build(BuildContext context) {
    final List<Widget> ruangan = <Widget>[
      const Center(
        child: Text(
          'Ini Halaman Home',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Coba Tekan button Ini:',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print('ElevatedButton ditekan!');
              },
              child: const Text('Submit (Elevated)'),
            ),
            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                print('TextButton sukses ditekan!');
              },
              child: const Text('Menu (TextButton)'),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedValue,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: 'Pilihan 1',
                    child: Text('Pilihan 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Pilihan 2',
                    child: Text('Pilihan 2'),
                  ),
                  DropdownMenuItem(
                    value: 'Pilihan 3',
                    child: Text('Pilihan 3'),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ),

      const Center(
        child: Text(
          'Ini Halaman Profil',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gabungan Menu & Tombol'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: ruangan.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_button_sharp),
            label: 'Buttons',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
