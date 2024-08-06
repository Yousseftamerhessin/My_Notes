import 'package:flutter/material.dart';

class RateApp extends StatelessWidget {
  const RateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.rate_review_outlined),
      title: const Text('Rate App'),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
