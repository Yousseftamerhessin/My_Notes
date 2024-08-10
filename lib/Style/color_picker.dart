import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> showColorPickerDialog(BuildContext context) {
  return showDialog<Color?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.color_lens, color:Color(0xFFFE6902),),
            SizedBox(width: 8.0),
            Text('Select Color'),
          ],
        ),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: const Color(0xFFFDA0B3),
            onColorChanged: (Color color) {
              Navigator.of(context).pop(color);
            },
            availableColors: const [
              Color(0xFFFFD573),
              Color(0xFFFDA0B3),
              Color(0xFF41B7FF),
              Color(0xFFFF65A3),
              Color(0xFFFE6902),
            ],
          ),
        ),
      );
    },
  );
}
