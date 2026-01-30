import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/button_widget.dart';

class PollComponent extends StatelessWidget {
  const PollComponent({
    super.key,
    required this.controller,
    required this.question,
    required this.answers,
  });
  final String controller;
  final String question;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onInverseSurface,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Gap(16),
            Column(
              children: [
                ...answers.map(
                  (e) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ReactiveRadioListTile(
                      fillColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.outline,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      tileColor:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      title: Text(e),
                      formControlName: controller,
                      value: e,
                    ),
                  ),
                )
              ],
            ),
            Gap(16),
            ButtonWidget(
              text: "See Results".i18n,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: Icon(Icons.emoji_events),
                      title: Text("Results".i18n),
                      content: Text("Coming Soon".i18n),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
