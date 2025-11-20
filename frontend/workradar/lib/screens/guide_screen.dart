import 'package:flutter/material.dart';
import 'package:workradar/config/app_screens.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  Widget guideItem(BuildContext context, String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // The image/video area: fixed tall height (33% of screen) and full width
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.33,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // URL gambar sesuai contoh
    final imageUrl =
        'https://i.ibb.co/m6gqjdw/sample-image.png'; // Ganti sesuai URL gambar Anda
    

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppScreens.settings);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Guide'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, AppScreens.settings),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              guideItem(context, '1. halaman beranda', imageUrl),
              const SizedBox(height: 12),
              guideItem(context, '2. halaman Task', imageUrl),
              const SizedBox(height: 12),
              guideItem(context, '3. halaman Settings', imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}

