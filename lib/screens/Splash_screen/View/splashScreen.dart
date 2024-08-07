import 'package:NotesApp/Logic/Auth.dart';
import 'package:NotesApp/screens/Splash_screen/Widgets/First_splash.dart';
import 'package:NotesApp/screens/Splash_screen/Widgets/second_splash.dart';
import 'package:NotesApp/screens/Splash_screen/Widgets/third_splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        FirstSplash(),
        SecondSplash(),
        ThirdSplash(),
      ],
      onPageChanged: (index) async {
        if (index == 2) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('hasSeenSplash', true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Auth()),
          );
        }
      },
    );
  }
}
