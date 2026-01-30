import 'package:flutter/material.dart';
import 'package:news_watch/translation.dart';

class NewsOptionsComponent extends StatelessWidget {
  const NewsOptionsComponent({
    super.key,
    required this.commentOnTap,
    required this.likeOnTap,
    required this.shareOnTap,
    required this.numberOfComments,
    required this.numberOfLike,
    this.newsIsLiked,
  });
  final Function()? commentOnTap;
  final Function()? likeOnTap;
  final Function()? shareOnTap;
  final int numberOfLike;
  final int numberOfComments;
  final bool? newsIsLiked;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        SizedBox(
          width: 175,
          child: TextButton.icon(
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                iconColor: Theme.of(context).colorScheme.onSurface),
            onPressed: commentOnTap,
            label: Text(
              "%s comments".i18n.fill([numberOfComments]),
            ),
            icon: Icon(Icons.chat_bubble_outline),
          ),
        ),
        SizedBox(
          width: 175,
          child: TextButton.icon(
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                iconColor: Theme.of(context).colorScheme.onSurface),
            onPressed: likeOnTap,
            label: Text("%s likes".i18n.fill([numberOfLike])),
            icon: Icon(
                newsIsLiked == true ? Icons.favorite : Icons.favorite_border),
          ),
        ),
        SizedBox(
          width: 175,
          child: TextButton.icon(
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                iconColor: Theme.of(context).colorScheme.onSurface),
            onPressed: shareOnTap,
            label: Text("Share".i18n),
            icon: Icon(Icons.share),
          ),
        ),
      ],
    );
  }
}
