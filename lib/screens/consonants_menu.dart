import 'package:flutter/material.dart';

class ConstantsMenuPage extends StatelessWidget{
  const ConstantsMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background-lava.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16 ),
          child: Column(
            children: [
              Text(
                'Menu de seleccion',
                style: TextStyle(fontSize: 40, color: Colors.white),
              )
            ],
          )
        ),
      )
    );
  }
}