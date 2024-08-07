import 'package:NotesApp/screens/Splash_screen/Widgets/second_splash.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstSplash extends StatelessWidget {
  const FirstSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFDA0B3),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: LottieBuilder.asset('assets/photo/Animation_first.json'),
              ),
              const SizedBox(height: 50.0),
              const Text(
                'Take notes on',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: -2,
                ),
              ),
              const Text(
                'any device',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: -2,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondSplash()),
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
