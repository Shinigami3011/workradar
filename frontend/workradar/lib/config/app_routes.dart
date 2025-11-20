import 'package:flutter/material.dart';
import 'app_screens.dart';
import '../screens/main_screen.dart';
import '../screens/task_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/guide_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.home:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case AppScreens.task:
        return MaterialPageRoute(builder: (_) => TaskScreen());
      case AppScreens.settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case AppScreens.guide:
        return MaterialPageRoute(builder: (_) => const GuideScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}