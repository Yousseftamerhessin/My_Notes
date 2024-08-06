import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isNewFirst = true;

  void _sortAndStoreNotes() {
    print('تبديل الترتيب: ${isNewFirst ? 'الأحدث أولاً' : 'الأقدم أولاً'}');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'My Notes',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          IconButton(
            icon: isNewFirst
                ? const Icon(FontAwesomeIcons.sortAmountDown)
                : const Icon(FontAwesomeIcons.sortAmountUp),
            onPressed: () {
              setState(() {
                isNewFirst = !isNewFirst;
                _sortAndStoreNotes();
              });
            },
          ),
        ],
      ),
    );
  }
}
