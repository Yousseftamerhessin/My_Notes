import 'package:NotesApp/screens/add_notes.dart';
import 'package:NotesApp/wedgets/Home_Drawer.dart';
import 'package:NotesApp/wedgets/notes_view_body.dart';
import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
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
