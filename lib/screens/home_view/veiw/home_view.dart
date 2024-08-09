import 'package:NotesApp/screens/%D9%90add_notes.dart/Veiw/add_notes.dart';
import 'package:NotesApp/screens/home_drawer/View/Home_Drawer.dart';
import 'package:NotesApp/screens/home_view/widget/notes_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotes()),
          );
        },
        child: const Icon(Icons.add),
      ),
      drawer: const HomeDrawer(),
      body: const NotesViewBody(),
    );
  }
}
