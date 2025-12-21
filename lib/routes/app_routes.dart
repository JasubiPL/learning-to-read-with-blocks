import 'package:flutter/material.dart';
import 'package:learning_to_read_with_blocks/screens/consonants_menu.dart';
import '../screens/splash_page.dart';
import '../screens/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const splash = '/splash';
  static const constantsMenu = '/constants_menu_page';

  static Map<String, WidgetBuilder> get routes{
    return {
      splash: (context) => const SplashPage(),
      home: (context) => const HomePage(),
      constantsMenu: (context) => ConstantsMenuPage(),
    };
  }
}