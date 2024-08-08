import 'package:NotesApp/Style/color_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  Color _selectedColor = Colors.blue; 

  Future<void> _selectColor() async {
    final color = await showColorPickerDialog(context);
    if (color != null) {
      setState(() {
        _selectedColor = color;
      });
    }
  }

  Future<void> _addNote() async {
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
      await FirebaseFirestore.instance.collection('notes').add({
        'title': title,
        'content': content,
        'date': Timestamp.now(),
        'color': _selectedColor.value, 
      });
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add note: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
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
                  color: Colors.grey,
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
                    color: Colors.grey,
                  ),
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectColor,
              child: const Text('Select Color'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        backgroundColor: Colors.grey.shade800.withOpacity(0.8),
        child: const Icon(Icons.save),
      ),
    );
  }
}
