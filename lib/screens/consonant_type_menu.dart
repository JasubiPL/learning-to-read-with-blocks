import 'package:flutter/material.dart';
import 'package:learning_to_read_with_blocks/components/default_button.dart';
import 'package:learning_to_read_with_blocks/routes/app_routes.dart';

class ConsonantTypeMenu extends StatelessWidget {
  const ConsonantTypeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background-home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            child: Column(
              children: [
                Spacer(),
                DefaultButton(
                  text: 'Ba, Be, Bi...',
                  height: 90,
                  textSize: 18,
                  isFull: true,
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.constantsMenu),
                ),
                SizedBox(height: 24),
                DefaultButton(
                  text: 'Bla, Bre ',
                  height: 90,
                  textSize: 18,
                  isFull: true,
                  variant: 'diamond',
                  onPressed: () => Navigator.pushNamed(
                      context, AppRoutes.compoundConsonantsMenu),
                ),
                SizedBox(height: 24),
                DefaultButton(
                  text: 'An, Al, Ar...',
                  height: 90,
                  textSize: 18,
                  isFull: true,
                  variant: 'gold',
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.linksMenu),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
