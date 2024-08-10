import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  hintColor:  Colors.black54,
  scaffoldBackgroundColor: Colors.grey[200],
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.green, 
    foregroundColor: Colors.black, 
  ),
  appBarTheme:  const AppBarTheme(
     color:Colors.green,
  ),
);