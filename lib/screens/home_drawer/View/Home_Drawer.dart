import 'package:NotesApp/screens/home_drawer/Widgets/Dark_mode.dart';
import 'package:NotesApp/screens/home_drawer/Widgets/Help_Tile.dart';
import 'package:NotesApp/screens/home_drawer/Widgets/Log_out.dart';
import 'package:NotesApp/screens/home_drawer/Widgets/Rate_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email ?? 'Not signed in';
    final userName = user?.displayName ?? 'User name';

    return Drawer(
      child: Container(
        color: Colors.green[900],
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[800],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 4), 
                  ),
                ],
              ),
              accountName: Text(
                userName,
                style: const TextStyle(color: Colors.white), 
              ),
              accountEmail: Text(
                userEmail,
                style: const TextStyle(color: Colors.white70), 
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white, 
                child: Text(
                  userName.isNotEmpty ? userName[0] : 'A',
                  style: TextStyle(color: Colors.green[800]), 
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const DarkMode(),
            const RateApp(),
            const HelpTile(),
            const LogOut(),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Development by Youssef Tamer',
                style: TextStyle(
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
