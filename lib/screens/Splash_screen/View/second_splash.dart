import 'package:NotesApp/screens/Splash_screen/View/First_splash.dart';
import 'package:NotesApp/screens/Splash_screen/View/third_splash.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondSplash extends StatelessWidget {
  const SecondSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFD573),
        body: Stack(children: [
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child:
                    LottieBuilder.asset('assets/photo/Animation_second.json'),
              ),
              const Text(
                'Organize every',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: -2,
                ),
              ),
              const Text(
                'task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: -2,
                ),
              ),
            ]),
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
                  MaterialPageRoute(builder: (context) => const FirstSplash()),
                  ModalRoute.withName('/'),
                );
              },
              child: const Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdSplash()),
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
