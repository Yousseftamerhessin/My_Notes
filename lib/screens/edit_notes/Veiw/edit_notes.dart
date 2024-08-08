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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Title and content cannot be empty.'),
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('notes').doc(noteId).update({
        'title': title,
        'content': content,
        'date': Timestamp.now(),
      });
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update note: $e'),
        ),
      );
    }
  }

  Future<void> _deleteNote(BuildContext context) async {
    await FirebaseFirestore.instance.collection('notes').doc(noteId).delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteNote(context),
            color: Colors.red,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 30.0,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: contentController,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something here',
                  hintStyle: TextStyle(
                  ),
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateNote(context),
        child: const Icon(Icons.save),
      ),
    );
  }
}
