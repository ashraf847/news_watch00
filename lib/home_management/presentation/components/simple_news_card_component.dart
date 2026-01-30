import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_watch/home_management/domain/news.dart';
import 'package:news_watch/translation.dart';

class SimpleNewsCardComponent extends ConsumerWidget {
  final News news;

  const SimpleNewsCardComponent({super.key, required this.news});
  @override
  Widget build(BuildContext context, ref) {
    Document d = Document.fromJson(jsonDecode(news.details));
    String plainText = d.toPlainText();
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          "news_details",
          pathParameters: {"id": news.id!},
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.onInverseSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: news.profilePictureUrl == null
                    ? SvgPicture.asset(height: 180, "assets/svg/no-image.svg")
                    : Image.network(
                        news.profilePictureUrl!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            // Title and Author
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    plainText,
                    style: TextStyle(color: Colors.grey[800]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${news.numberOfComments} ${"Comments".i18n}",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Gap(5),
                        Text("●"),
                        Gap(5),
                        Text(
                          "${news.numberOfLikes} ${"Likes".i18n}",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
