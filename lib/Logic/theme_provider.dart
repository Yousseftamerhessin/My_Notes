import 'package:NotesApp/Style/theme.data/Dark_Theme.dart';
import 'package:NotesApp/Style/theme.data/Light_Theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkTheme;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (isDarkMode) {
      setTheme(lightTheme);
    } else {
      setTheme(darkTheme);
    }
  }
}
