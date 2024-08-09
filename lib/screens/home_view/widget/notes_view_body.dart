import 'package:flutter/material.dart';
import 'package:NotesApp/screens/home_view/widget/Custom_Search.dart';
import 'package:NotesApp/screens/home_view/widget/Dynamic_Gride_View.dart';
import 'package:NotesApp/screens/home_view/widget/Sort_icon.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  _NotesViewBodyState createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isNewFirst = true;
  String searchQuery = ''; // حالة لتخزين النص المدخل في البحث

  void _toggleSortOrder() {
    setState(() {
      isNewFirst = !isNewFirst;
      print('Sort order changed: $isNewFirst');
    });
  }

  void _onSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CustomSearch(onSearch: _onSearch), // تمرير دالة البحث
          SortIcon(
            isNewFirst: isNewFirst,
            onSortOrderChanged: _toggleSortOrder,
          ),
          Expanded(
            child: DynamicGrideView(
              isNewFirst: isNewFirst,
              searchQuery: searchQuery, // تمرير نص البحث
            ),
          ),
        ],
      ),
    );
  }
}
