import 'package:flutter/material.dart';
import 'package:news_watch/translation.dart';

class TCWidget extends StatelessWidget {
  const TCWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Last updated: 13/02/2025\n\nWelcome to News Watch! By using our app, you agree to the following terms:\n1- User Roles\nReporters: Must provide accurate and lawful content. False or harmful posts are prohibited.\nViewers: Content is for informational purposes only. Verify news independently.\n\n2- Content Ownership\nReporters retain ownership of their content but grant News Watch the right to display, distribute, and modify it as needed."
          .i18n,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
