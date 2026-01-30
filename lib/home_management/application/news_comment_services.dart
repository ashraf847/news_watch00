import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/translation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/firestore_news_comment_repository.dart';
import '../data/firestore_news_repository.dart';
import '../domain/news_comment.dart';

part 'news_comment_services.g.dart';

@riverpod
NewsCommentServices newsCommentServices(Ref ref) {
  return NewsCommentServices(
    firestoreNewsCommentRepository:
        ref.read(firestoreNewsCommentRepositoryProvider),
    firestoreNewsRepository: ref.read(firestoreNewsRepositoryProvider),
    ref: ref,
  );
}

class NewsCommentServices {
  final FirestoreNewsCommentRepository firestoreNewsCommentRepository;
  final FirestoreNewsRepository firestoreNewsRepository;

  final Ref ref;
  NewsCommentServices({
    required this.firestoreNewsCommentRepository,
    required this.firestoreNewsRepository,
    required this.ref,
  });

  Future<void> createComment({
    required String newsId,
    required String userId,
    required String comment,
  }) async {
    try {
      BotToast.showLoading();
      var c = NewsComment(
        userId: userId,
        newsId: newsId,
        date: DateTime.now(),
        comment: comment,
      );

      await firestoreNewsCommentRepository.createNewsComment(newsComment: c);

      var news = await firestoreNewsRepository.readNews(id: newsId);

      if (news != null) {
        await firestoreNewsRepository.updateNews(
          news: news.copyWith(
            numberOfComments: (news.numberOfComments ?? 0) + 1,
          ),
        );
      }
      BotToast.closeAllLoading();
    } catch (e) {
      BotToast.showText(text: "Something Went Wrong".i18n);
    }
  }
}
