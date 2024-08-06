import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  hintColor: Colors.black,
  scaffoldBackgroundColor: Colors.grey[200],
  textTheme: const TextTheme(),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
  hintColor: Colors.white,
);
