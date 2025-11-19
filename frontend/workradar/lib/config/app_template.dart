import 'package:flutter/material.dart';

// template untuk bottom navigation bar
class AppTemplate extends StatelessWidget {
  final Widget child;
  final String currentRoute;
  final Color? appBarColor; // Parameter opsional
  final Color? bottomBarColor; // Tambahkan parameter untuk warna bottom bar

  const AppTemplate({
    Key? key,
    required this.child,
    required this.currentRoute,
    this.appBarColor, // Opsional, default null
    this.bottomBarColor, // Opsional, default null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getRouteTitle(currentRoute),
          style: TextStyle(
            color: appBarColor != null ? Colors.white : Colors.black, // Sesuaikan warna teks
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor ?? Colors.white, // Default putih
        elevation: 0,
        iconTheme: IconThemeData(
          color: appBarColor != null ? Colors.white : Colors.black, // Sesuaikan icon
        ),
      ),
      body: child,
      bottomNavigationBar: _buildBottomNavigation(context, currentRoute)
    );
  }

  // Fungsi untuk mengubah route menjadi judul yang lebih user-friendly
  String _getRouteTitle(String route) {
    switch (route) {
      case '/beranda':
        return 'Beranda';
      case '/tugas':
        return 'Tugas';
      case '/tambah-tugas':
        return 'Tambah Tugas';
      case '/pengaturan':
        return '';
      default:
        return route.replaceFirst('/', ''); // Fallback
    }
  }

  Widget _buildBottomNavigation(BuildContext context, String currentRoute) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(currentRoute),
      backgroundColor: bottomBarColor ?? Colors.white, // Gunakan warna custom atau default putih
      selectedItemColor: Colors.blue.shade700, // Warna item terpilih
      unselectedItemColor: Colors.grey.shade600, // Warna item tidak terpilih
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tugas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
      onTap: (index) => _onTabTapped(context, index),
    );
  }

  int _getCurrentIndex(String route) {
    switch (route) {
      case '/beranda':
        return 0;
      case '/tugas':
      case '/tambah-tugas': 
        return 1;
      case '/pengaturan':
        return 2;
      default:
        return 0;
    }
  }

  void _onTabTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        if (currentRoute != '/beranda') {
          Navigator.pushNamed(context, '/beranda');
        }
        break;
      case 1:
        if (currentRoute != '/tugas') {
          Navigator.pushNamed(context, '/tugas');
        }
        break;
      case 2:
        if (currentRoute != '/pengaturan') {
          Navigator.pushNamed(context, '/pengaturan');
        }
        break;  
    }
  }
}