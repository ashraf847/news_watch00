import '../domain/news_comment.dart';

abstract class NewsCommentRepository {
  Future<void> createNewsComment({required NewsComment newsComment});
  Future<NewsComment?> readNewsComment({required String id});
  Future<void> updateNewsComment({required NewsComment newsComment});
  Future<void> deleteNewsComment({required String id});
}
