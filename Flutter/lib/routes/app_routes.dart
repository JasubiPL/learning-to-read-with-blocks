import 'package:flutter/material.dart';
import '../screens/splash_page.dart';
import '../screens/home_page.dart';

class AppRoutes {
  static const splash = '/splash';
  static const home = '/';

  static Map<String, WidgetBuilder> get routes{
    return {
      splash: (context) => const SplashPage(),
      home: (context) => const HomePage(),
    };
  }
}