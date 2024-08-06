import 'package:flutter/material.dart';
import 'package:NotesApp/screens/home_view/widget/Dynamic_Gride_View.dart';
import 'package:NotesApp/screens/home_view/widget/Custom_App_Bar.dart';
import 'package:NotesApp/screens/home_view/widget/Custom_Search.dart';
import 'package:NotesApp/screens/home_view/widget/Sort_icon.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  _NotesViewBodyState createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isNewFirst = true;

  void _toggleSortOrder() {
    setState(() {
      isNewFirst = !isNewFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const CustomAppBar(),
          const CustomSearch(),
          SortIcon(
            isNewFirst: isNewFirst,
            onSortOrderChanged: _toggleSortOrder,
          ),
          Expanded(
            child: DynamicGrideView(
              isNewFirst: isNewFirst,
            ),
          ),
        ],
      ),
    );
  }
}
