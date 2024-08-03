import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // استيراد مكتبة الأيقونات

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isNewFirst = true; // حالة للتحكم في ترتيب العناصر

  // دالة لفرز وتخزين الملاحظات
  void _sortAndStoreNotes() {
    // منطق فرز وتخزين الملاحظات
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
                ? const Icon(
                    FontAwesomeIcons.sortAmountDown) // أيقونة "ترتيب تنازلي"
                : const Icon(
                    FontAwesomeIcons.sortAmountUp), // أيقونة "ترتيب تصاعدي"
            onPressed: () {
              setState(() {
                isNewFirst = !isNewFirst; // تبديل حالة ترتيب العناصر
                _sortAndStoreNotes(); // استدعاء دالة الفرز والتخزين
              });
            },
          ),
        ],
      ),
    );
  }
}
