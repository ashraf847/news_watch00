import 'dart:io';
import '../domain/news.dart';

abstract class NewsRepository {
  Future<String> createNews({required News news});
  Future<News?> readNews({required String id});
  Future<void> updateNews({required News news});
  Future<void> deleteNews({required String id});
  Stream<List<News>> streamAllNews();
  Future<String> uploadFile({
    required File file,
    required String folderPath,
  });
  Future<List<NewsWithUser>> getTop10NewsWithUser({
    required String currentUserId,
    required String searchText,
  });
  Future<List<News>> getUserNews({required String userId});
  Stream<NewsWithUser?> streamNews({required String id, required userId});
}
