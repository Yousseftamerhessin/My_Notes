import 'package:NotesApp/Logic/Auth.dart';
import 'package:NotesApp/Logic/theme_provider.dart';
import 'package:NotesApp/Style/theme.dart';
import 'package:NotesApp/screens/Splash_screen/Widgets/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(lightTheme),
      child: NotesApp(hasSeenSplash: hasSeenSplash),
    ),
  );
}

class NotesApp extends StatelessWidget {
  final bool hasSeenSplash;

  const NotesApp({super.key, required this.hasSeenSplash});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      home: hasSeenSplash ? const Auth() : const SplashScreens(),
    );
  }
}
