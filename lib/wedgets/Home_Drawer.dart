import 'package:NotesApp/wedgets/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('User name'),
            accountEmail: Text('Email '),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text('A'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(' Home page'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الإعدادات'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark mode'),
            onTap: () {
              final themeNotifier =
                  Provider.of<ThemeProvider>(context, listen: false);
              themeNotifier.toggleTheme();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('حول التطبيق'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
