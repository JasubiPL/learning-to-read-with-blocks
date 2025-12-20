import 'package:flutter/material.dart';
import 'package:learning_to_read_with_blocks/features/splash/splash_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage()
    );
  }
}