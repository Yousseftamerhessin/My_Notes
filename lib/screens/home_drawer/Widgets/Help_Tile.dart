import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpTile extends StatelessWidget {
  const HelpTile({super.key});

  final String _emailAddress = 'ytamerhessin@gmail.com';

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: _emailAddress,
      queryParameters: {
        'subject': 'Help and Feedback',
        'body': 'Please write your feedback here.',
      },
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      print('Could not launch email client: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.help_outline),
      title: const Text('Help and Feedback'),
      onTap: _sendEmail,
    );
  }
}
