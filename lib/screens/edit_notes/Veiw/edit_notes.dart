import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNotes extends StatelessWidget {
  final String noteId;
  final String initialTitle;
  final String initialContent;

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  EditNotes({
    super.key,
    required this.noteId,
    required this.initialTitle,
    required this.initialContent,
  }) {
    titleController.text = initialTitle;
    contentController.text = initialContent;
  }

  Future<void> _updateNote(BuildContext context) async {
    final title = titleController.text;
    final content = contentController.text;

    if (title.isEmpty || content.isEmpty) {
      return;
    }

    await FirebaseFirestore.instance.collection('notes').doc(noteId).update({
      'title': title,
      'content': content,
      'date': Timestamp.now(),
    });

    Navigator.pop(context);
  }

  Future<void> _deleteNote(BuildContext context) async {
    await FirebaseFirestore.instance.collection('notes').doc(noteId).delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.arrow_back_ios)),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () => _deleteNote(context),
                icon: const Icon(
                  size: 30,
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ]),
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: titleController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontSize: 30.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextField(
                    controller: contentController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something here',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateNote(context),
        elevation: 10,
        backgroundColor: Colors.grey,
        child: const Icon(Icons.save),
      ),
    );
  }
}
