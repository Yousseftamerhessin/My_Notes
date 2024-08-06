import 'package:flutter/material.dart';

class AddNotes extends StatelessWidget {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  AddNotes({super.key});

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
                padding: const EdgeInsets.all(0),
                icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.arrow_back_ios)),
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
        onPressed: () {
          Navigator.pop(context);
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800.withOpacity(0.8),
        child: const Icon(Icons.save),
      ),
    );
  }
}
