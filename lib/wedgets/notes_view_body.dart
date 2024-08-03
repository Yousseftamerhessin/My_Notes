import 'package:NotesApp/wedgets/Dynamic_Gride_View.dart';
import 'package:NotesApp/wedgets/Custom_App_Bar.dart';
import 'package:NotesApp/wedgets/Custom_Search.dart';
import 'package:flutter/material.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CustomAppBar(),
          CustomSearch(),
          SizedBox(
            height: 10,
          ),
          DynamicGrideView(),
        ],
      ),
    );
  }
}
