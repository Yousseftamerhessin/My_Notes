import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SortIcon extends StatelessWidget {
  final bool isNewFirst;
  final VoidCallback onSortOrderChanged;

  const SortIcon({
    super.key,
    required this.isNewFirst,
    required this.onSortOrderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // محاذاة الأيقونة على الشمال
      child: IconButton(
        iconSize: 24.0, // تصغير حجم الأيقونة
        icon: Icon(
          isNewFirst
              ? FontAwesomeIcons.sortAmountDown
              : FontAwesomeIcons.sortAmountUp,
        ),
        onPressed: onSortOrderChanged,
      ),
    );
  }
}
