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
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[200], // إضافة لون خلفية للتصميم
        ),
        child: TextField(
          onChanged: onSearch, // تمرير دالة البحث
          style: const TextStyle(
            fontSize: 16.0,
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
