import 'package:NotesApp/Logic/Auth.dart';
import 'package:NotesApp/screens/Splash_screen/Widgets/second_splash.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThirdSplash extends StatelessWidget {
  const ThirdSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF77BAEF),
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/photo/Animation_third.json'),
              const Text(
                'Work more',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: -2,
                ),
              ),
              const Text(
                'effectively',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: -2,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondSplash()),
                  ModalRoute.withName('/'),
                );
              },
              child: const Text('Back'),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Auth()),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: LottieBuilder.asset('assets/photo/Animation_icon_next.json'),
        ),
      ),
    );
  }
}
