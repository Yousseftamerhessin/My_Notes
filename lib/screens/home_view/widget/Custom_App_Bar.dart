import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          Text(
            'My Notes',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
