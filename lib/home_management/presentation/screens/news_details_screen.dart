import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:share_plus/share_plus.dart';
import '../../../auth/application/auth_notifier_provider.dart';
import '../../../core/presentation/components/news_options_component.dart';
import '../../../core/presentation/widgets/go_up_floating_button_widget.dart'
    show GoUpFloatingButtonWidget;
import '../../application/news_comment_services.dart';
import '../../application/news_like_services.dart';
import '../../application/stream_news_details_providers.dart';

class NewsDetailsScreen extends ConsumerWidget {
  const NewsDetailsScreen({
    super.key,
    required this.newsId,
  });
  final String newsId;

  @override
  Widget build(BuildContext context, ref) {
    var newsStream = ref.watch(streamNewsProvider(newsId));
    var newsComments = ref.watch(getNewsCommentsProvider(newsId));
    var ctr = ScrollController();
    return Scaffold(
      floatingActionButton: GoUpFloatingButtonWidget(
        onPressed: () {
          ctr.animateTo(
            0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
      ),
      appBar: AppBar(),
      body: newsStream.when(
        data: (news) {
          return ListView(
            controller: ctr,
            children: [
              if (news!.news.profilePictureUrl != null &&
                  news.news.profilePictureUrl!.isNotEmpty)
                Image.network(
                  height: 250,
                  news.news.profilePictureUrl!,
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  news.news.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              NewsOptionsComponent(
                commentOnTap: () {
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
                                      .read(newsCommentServicesProvider)
                                      .createComment(
                                        newsId: news.news.id ?? "",
                                        userId:
                                            ref.read(authNotifierProvider)!.id!,
                                        comment:
                                            formGroup.control("comment").value,
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
                likeOnTap: () {
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
                shareOnTap: () async {
                  // ignore: unused_local_variable
                  final result = await Share.shareUri(
                    Uri(
                      scheme: 'https',
                      host: 'www.news-watch.com',
                      path: '/news/${news.news.id}',
                    ),
                  );
                },
                numberOfComments: news.news.numberOfComments ?? 0,
                numberOfLike: news.news.numberOfLikes ?? 0,
                newsIsLiked: news.liked,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: QuillEditor.basic(
                  controller: QuillController(
                    readOnly: true,
                    document: Document.fromJson(jsonDecode(news.news.details)),
                    selection: TextSelection(baseOffset: 0, extentOffset: 0),
                  ),
                ),
              ),
              newsComments.when(
                data: (data) {
                  return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor:
                              Theme.of(context).colorScheme.onInverseSurface,
                          title: Text(
                            data[index].comment.comment,
                          ),
                          subtitle: Text(
                            data[index].userName,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: data.length);
                },
                error: (error, stackTrace) => Text("Something went wrong".i18n),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) => Text("Something went wrong".i18n),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
