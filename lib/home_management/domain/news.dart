import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_watch/auth/domain/app_user.dart';

part 'news.freezed.dart';
part 'news.g.dart';

enum Category { politics, tech, healthy, science }

@freezed
class News with _$News {
  factory News({
    String? id,
    required String userId,
    required String title,
    required String details,
    required Category category,
    required DateTime date,
    required List<String> tags,
    String? profilePictureUrl,
    // -------------------------------------------------------------------------
    @Default(0) int? numberOfLikes,
    @Default(0) int? numberOfComments,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

// Combine Model
class NewsWithUser {
  final News news;
  final AppUser writer;
  final bool liked;

  NewsWithUser({
    required this.news,
    required this.writer,
    required this.liked,
  });
}
