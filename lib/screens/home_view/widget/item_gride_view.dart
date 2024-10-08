import 'package:flutter/material.dart';

class ItemGridView extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final Color color; 
  final VoidCallback onTap;

  const ItemGridView({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.color, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color, 
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
              color: Colors.black,

                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
