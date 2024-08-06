import 'package:NotesApp/Logic/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return ListTile(
      leading: Icon(
        isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
      ),
      title: Text(isDarkMode ? 'Light mode' : 'Dark mode'),
      onTap: () {
        final themeNotifier =
            Provider.of<ThemeProvider>(context, listen: false);
        themeNotifier.toggleTheme();
        Navigator.pop(context);
      },
    );
  }
}
