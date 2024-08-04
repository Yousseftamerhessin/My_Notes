import 'package:NotesApp/screens/edit_notes.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class ItemGridView extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const ItemGridView({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      onPressed: () {},
      menuItems: [
        FocusedMenuItem(
          title: const Text(
            "pin top",
            style: TextStyle(color: Colors.black),
          ),
          trailingIcon: const Icon(
            Icons.push_pin_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        FocusedMenuItem(
          title: const Text(
            "Share",
            style: TextStyle(color: Colors.black),
          ),
          trailingIcon: const Icon(
            Icons.share,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        FocusedMenuItem(
          title: const Text(
            "Favorite",
            style: TextStyle(color: Colors.black),
          ),
          trailingIcon: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        FocusedMenuItem(
          title: const Text(
            "Delete",
            style: TextStyle(color: Colors.redAccent),
          ),
          trailingIcon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () {},
        ),
      ],
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditNotes()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
