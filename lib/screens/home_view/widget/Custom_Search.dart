import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final Function(String) onSearch;

  const CustomSearch({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade800.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          onChanged: onSearch, // استدعاء onSearch كلما تغير النص
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search Notes...',
          ),
        ),
      ),
    );
  }
}
