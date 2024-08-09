import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

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
