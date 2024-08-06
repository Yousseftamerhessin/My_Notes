import 'package:NotesApp/Logic/theme_provider.dart';
import 'package:NotesApp/screens/login_register_scrreen/View/Login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } catch (e) {
                  print('Error signing out: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to sign out: $e')),
                  );
                }
              }),
        ],
      ),
    );
  }
}
