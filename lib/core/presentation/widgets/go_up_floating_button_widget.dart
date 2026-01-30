import 'package:flutter/material.dart';
import 'package:news_watch/translation.dart';

class GoUpFloatingButtonWidget extends StatelessWidget {
  const GoUpFloatingButtonWidget({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Go Up".i18n,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.scrim,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_upward,
        color: Theme.of(context).colorScheme.scrim,
      ),
    );
  }
}
