import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraPage(),
    );
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  final ImagePicker picker = ImagePicker();
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool showCamera = false;

  File? selectedImage;

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  /// Ambil foto dari kamera
  Future<void> takePhoto() async {
    try {
      if (!controller.value.isInitialized) return;

      final XFile image = await controller.takePicture();

      setState(() {
        selectedImage = File(image.path);
        showCamera = false;
      });

      await showNotification(
        "Foto Berhasil Diambil",
        "Gambar berhasil disimpan dari kamera",
      );
    } catch (e) {
      debugPrint("Error kamera: $e");
    }
  }

  /// Pilih gambar dari galeri
  Future<void> pickImage() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }

      await showNotification(
        "Foto Berhasil Dipilih",
        "Gambar berhasil dipilih dari galeri",
      );
    } catch (e) {
      debugPrint("Error galeri: $e");
    }
  }

  //Inisialisasi notifikasi
  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await notificationsPlugin.initialize(settings: settings);

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  //Method untuk menampilkan notifikasi
  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'photo_channel',
          'Photo Notification',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await notificationsPlugin.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tugas Pertemuan 12 - Camera & Gallery"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Preview kamera
              if (showCamera)
                AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CameraPreview(controller),
                ),
              if (showCamera) ...[
                const SizedBox(height: 25),

                GestureDetector(
                  onTap: takePhoto,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],

              const SizedBox(height: 16),

              // Tombol kamera
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showCamera = true;
                    });
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Ambil Foto"),
                ),
              ),

              const SizedBox(height: 10),

              // Tombol galeri
              Center(
                child: ElevatedButton.icon(
                  onPressed: pickImage,
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Pilih dari Galeri"),
                ),
              ),

              const SizedBox(height: 20),

              // Hasil gambar
              if (selectedImage != null) ...[
                const Text(
                  "Hasil Gambar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.file(
                    selectedImage!,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
