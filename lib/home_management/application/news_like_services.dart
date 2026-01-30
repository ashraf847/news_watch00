import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/home_management/data/firestore_news_like_repository.dart';
import 'package:news_watch/home_management/domain/news_like.dart';
import 'package:news_watch/translation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/firestore_news_repository.dart';

part 'news_like_services.g.dart';

@riverpod
NewsLikeServices newsLikeServices(Ref ref) {
  return NewsLikeServices(
    firestoreNewsLikeRepository: ref.read(firestoreNewsLikeRepositoryProvider),
    firestoreNewsRepository: ref.read(firestoreNewsRepositoryProvider),
    ref: ref,
  );
}

class NewsLikeServices {
  final FirestoreNewsLikeRepository firestoreNewsLikeRepository;
  final FirestoreNewsRepository firestoreNewsRepository;

  final Ref ref;
  NewsLikeServices({
    required this.firestoreNewsLikeRepository,
    required this.firestoreNewsRepository,
    required this.ref,
  });

  Future<void> createLike({
    required String newsId,
    required String userId,
  }) async {
    try {
      var n = NewsLike(userId: userId, newsId: newsId, date: DateTime.now());

      await firestoreNewsLikeRepository.createNewsLike(newsLike: n);

      var news = await firestoreNewsRepository.readNews(id: newsId);

      if (news != null) {
        await firestoreNewsRepository.updateNews(
          news: news.copyWith(
            numberOfLikes: (news.numberOfLikes ?? 0) + 1,
          ),
        );
      }
    } catch (e) {
      BotToast.showText(text: "Something Went Wrong".i18n);
    }
  }

  Future<void> removeLike({
    required String newsId,
    required String userId,
  }) async {
    try {
      // NewsLike? n = (await ref
      //     .read(firestoreNewsLikeRepositoryProvider)
      //     .getNewsLikeByUserIdNewsId(userId: userId, newsId: newsId));

      // await firestoreNewsLikeRepository.deleteNewsLike(id: n?.id ?? "");

      await ref
          .read(firestoreNewsLikeRepositoryProvider)
          .deleteNewsLikeByUserIdAndNewsId(userId: userId, newsId: newsId);

      var news = await firestoreNewsRepository.readNews(id: newsId);

      if (news != null) {
        await firestoreNewsRepository.updateNews(
          news: news.copyWith(
            numberOfLikes: (news.numberOfLikes ?? 0) - 1,
          ),
        );
      }
    } catch (e) {
      BotToast.showText(text: "Something Went Wrong".i18n);
    }
  }
}
