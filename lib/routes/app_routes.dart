import 'package:flutter/material.dart';
import 'package:learning_to_read_with_blocks/screens/consonants_menu.dart';
import 'package:learning_to_read_with_blocks/screens/consonant_type_menu.dart';
import 'package:learning_to_read_with_blocks/screens/compound_consonants_menu.dart';
import 'package:learning_to_read_with_blocks/screens/links_menu.dart';
import '../screens/splash_page.dart';
import '../screens/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const splash = '/splash';
  static const consonantTypeMenu = '/consonant_type_menu';
  static const constantsMenu = '/constants_menu_page';
  static const compoundConsonantsMenu = '/compound_consonants_menu';
  static const linksMenu = '/links_menu';

  static Map<String, WidgetBuilder> get routes{
    return {
      splash: (context) => const SplashPage(),
      home: (context) => const HomePage(),
      consonantTypeMenu: (context) => const ConsonantTypeMenu(),
      constantsMenu: (context) => ConstantsMenuPage(),
      compoundConsonantsMenu: (context) => const CompoundConsonantsMenuPage(),
      linksMenu: (context) => const LinksMenuPage(),
    };
  }
}