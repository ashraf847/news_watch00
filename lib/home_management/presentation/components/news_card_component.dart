import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import 'package:news_watch/home_management/application/news_like_services.dart';
import 'package:news_watch/home_management/domain/news.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:share_plus/share_plus.dart';

import '../../application/news_comment_services.dart';

class NewsCardComponent extends ConsumerWidget {
  final NewsWithUser news;

  const NewsCardComponent({super.key, required this.news});
  @override
  Widget build(BuildContext context, ref) {
    Document d = Document.fromJson(jsonDecode(news.news.details));
    String plainText = d.toPlainText();
    var displayedText = "";
    var copyText = plainText;
    if (plainText.length > 150) {
      displayedText = "${plainText.substring(0, 150)}...";
    } else {
      displayedText = plainText;
    }
    return GestureDetector(
      onTap: () {
        context.goNamed(
          "news_details",
          pathParameters: {"id": news.news.id!},
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
                child: news.news.profilePictureUrl == null
                    ? SvgPicture.asset(height: 180, "assets/svg/no-image.svg")
                    : Image.network(
                        news.news.profilePictureUrl!,
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
                    news.news.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      news.writer.profilePictureUrl == null
                          ? Icon(Icons.person, size: 16, color: Colors.grey)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                height: 32,
                                width: 32,
                                news.writer.profilePictureUrl!,
                              ),
                            ),
                      SizedBox(width: 4),
                      Text(news.writer.name,
                          style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    displayedText,
                    style: TextStyle(color: Colors.grey[800]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (copyText.length > 150)
                    InkWell(
                      onTap: () {
                        context.goNamed(
                          "news_details",
                          pathParameters: {"id": news.news.id!},
                        );
                      },
                      child: Text(
                        "Read More".i18n,
                        style: TextStyle(color: Colors.blue),
                      ),
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
                      children: [
                        IconButton(
                          onPressed: () {
                            if (news.liked) {
                              ref.read(newsLikeServicesProvider).removeLike(
                                    newsId: news.news.id ?? "",
                                    userId: ref.read(authNotifierProvider)!.id!,
                                  );
                            } else {
                              ref.read(newsLikeServicesProvider).createLike(
                                  newsId: news.news.id ?? "",
                                  userId: ref.read(authNotifierProvider)!.id!);
                            }
                          },
                          icon: Icon(
                            news.liked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ReactiveForm(
                                  formGroup: FormGroup({
                                    "comment": FormControl<String>(),
                                  }),
                                  child: ReactiveFormConsumer(
                                      builder: (context, formGroup, child) {
                                    return AlertDialog(
                                      icon: Icon(Icons.comment),
                                      title: Text("Add Comment".i18n),
                                      content: ReactiveTextField(
                                        formControlName: "comment",
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "Comment".i18n,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text("Cancel".i18n),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Add".i18n),
                                          onPressed: () {
                                            ref
                                                .read(
                                                    newsCommentServicesProvider)
                                                .createComment(
                                                  newsId: news.news.id ?? "",
                                                  userId: ref
                                                      .read(
                                                          authNotifierProvider)!
                                                      .id!,
                                                  comment: formGroup
                                                      .control("comment")
                                                      .value,
                                                );
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  }),
                                );
                              },
                            );
                          },
                          icon: Icon(FontAwesomeIcons.comment),
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.share),
                          onPressed: () async {
                            // ignore: unused_local_variable
                            final result = await Share.shareUri(
                              Uri(
                                scheme: 'https',
                                host: 'www.news-watch.com',
                                path: '/news/${news.news.id}',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${news.news.numberOfComments} ${"Comments".i18n}",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Gap(5),
                        Text("●"),
                        Gap(5),
                        Text(
                          "${news.news.numberOfLikes} ${"Likes".i18n}",
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
