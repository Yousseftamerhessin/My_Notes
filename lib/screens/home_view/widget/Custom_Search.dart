import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  final Function(String) onSearch; // دالة البحث التي سيتم تمريرها من الوالد

  const CustomSearch({super.key, required this.onSearch});

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController _controller = TextEditingController();

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
          controller: _controller,
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
            prefixIconConstraints:
                BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search Notes...',
          ),
          onChanged: (text) {
            widget.onSearch(text); // تنفيذ وظيفة البحث عند تغيير النص
          },
        ),
      ),
    );
  }
}
