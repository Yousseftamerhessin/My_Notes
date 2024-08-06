import 'package:NotesApp/screens/home_view/widget/item_gride_view.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DynamicGrideView extends StatelessWidget {
  const DynamicGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DynamicHeightGridView(
        shrinkWrap: true,
        itemCount: 120,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        builder: (context, index) {
          return ItemGridView(
            title: 'Flutter Tips ${index + 1}',
            description: index == 2
                ? "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
                : 'Build your career with example ${index + 1}',
            date: '22 Jun, 2005',
          );
        },
      ),
    );
  }
}
