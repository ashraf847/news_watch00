import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_comment.freezed.dart';
part 'news_comment.g.dart';

@freezed
class NewsComment with _$NewsComment {
  factory NewsComment({
    String? id,
    required String userId,
    required String newsId,
    required DateTime date,
    required String comment,
  }) = _NewsComment;

  factory NewsComment.fromJson(Map<String, dynamic> json) =>
      _$NewsCommentFromJson(json);
}

class CommentUser {
  final NewsComment comment;
  final String userName;

  CommentUser({required this.comment, required this.userName});
}
