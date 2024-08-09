import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> showColorPickerDialog(BuildContext context) {
  return showDialog<Color?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Select Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: Colors.yellow, 
            onColorChanged: (Color color) {
              Navigator.of(context).pop(color);
            },
            availableColors: const [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.yellow,
              Colors.orange,
              Colors.purple,
              Colors.teal,
            ],
          ),
        ),
      );
    },
  );
}
