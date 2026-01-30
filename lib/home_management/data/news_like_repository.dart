import '../domain/news_like.dart';

abstract class NewsLikeRepository {
  Future<void> createNewsLike({required NewsLike newsLike});
  Future<NewsLike?> readNewsLike({required String id});
  Future<void> updateNewsLike({required NewsLike newsLike});
  Future<void> deleteNewsLike({required String id});
  Future<NewsLike?> getNewsLikeByUserIdNewsId({
    required String userId,
    required String newsId,
  });
  Future<void> deleteNewsLikeByUserIdAndNewsId({
    required String userId,
    required String newsId,
  });
}
