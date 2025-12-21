import 'package:flutter/material.dart';
import 'package:learning_to_read_with_blocks/components/default_button.dart';
import 'package:learning_to_read_with_blocks/routes/app_routes.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background-home.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Spacer(),
              Image(image: AssetImage('lib/assets/images/game-logo.png')),
              Spacer(),
              DefaultButton(
                text: 'Jugar',
                height: 70,
                isFull: true,
                onPressed: () => Navigator.pushNamed(context, AppRoutes.constantsMenu)
              )
            ],
          )
        ),
      )
    );
  }
}