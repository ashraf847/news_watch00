import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import '../data/firestore_news_comment_repository.dart';
import '../data/firestore_news_repository.dart';
import '../domain/news.dart';
import '../domain/news_comment.dart';

var getNewsCommentsProvider =
    StreamProvider.family.autoDispose<List<CommentUser>, String>(
  (ref, newsId) {
    return ref
        .read(firestoreNewsCommentRepositoryProvider)
        .streamAllCommentsWithUsersForNews(newsId: newsId);
  },
);

var streamNewsProvider =
    StreamProvider.family.autoDispose<NewsWithUser?, String>(
  (ref, newsId) {
    return ref.read(firestoreNewsRepositoryProvider).streamNews(
          id: newsId,
          userId: ref.read(authNotifierProvider)?.id ?? "",
        );
  },
);
