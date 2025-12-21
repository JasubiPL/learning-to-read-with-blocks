import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learning_to_read_with_blocks/screens/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ super.key });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (buildContext,animation, secondaryAnimation) => const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation, 
              curve: Curves.easeOutBack
            );

            return ScaleTransition(
              scale: curved,
              child: FadeTransition(opacity: animation, child: child,)
            );
          }
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green[700],
        child: Center(
          child: Image(image: AssetImage('lib/assets/images/pineyrosoft-logo.png'))
        ),
      ),
    );
  }
}