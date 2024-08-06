import 'package:flutter/material.dart';
import '../Style/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkTheme) {
      setTheme(lightTheme);
    } else {
      setTheme(darkTheme);
    }
  }
}
