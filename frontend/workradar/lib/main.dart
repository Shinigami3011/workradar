import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // ✅ Tambahkan ini
import 'config/app_screens.dart'; 
import 'config/app_routes.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Wajib kalau pakai async di main
  await initializeDateFormatting('id_ID', null); // ✅ Inisialisasi locale Indonesia

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkRadar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppScreens.guide,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
