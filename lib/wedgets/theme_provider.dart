import 'package:flutter/material.dart';
import 'theme.dart'; // تأكد من استيراد ملف الثيمات

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      setTheme(darkTheme);
    } else {
      setTheme(lightTheme);
    }
  }
}
