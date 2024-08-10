import 'package:NotesApp/screens/home_view/veiw/home_view.dart';
import 'package:NotesApp/screens/login_register_scrreen/View/Login_screen.dart';
import 'package:NotesApp/screens/login_register_scrreen/View/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Logic/Auth.dart';
import 'Logic/theme_provider.dart';
import 'Style/theme.data/Light_Theme.dart';
import 'screens/Splash_screen/View/splashScreen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => hasSeenSplash ? const Auth() : const SplashScreens(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}
