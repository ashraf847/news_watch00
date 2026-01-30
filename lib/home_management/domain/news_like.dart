import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_like.freezed.dart';
part 'news_like.g.dart';

@freezed
class NewsLike with _$NewsLike {
  factory NewsLike({
    String? id,
    required String userId,
    required String newsId,
    required DateTime date,
  }) = _NewsLike;

  factory NewsLike.fromJson(Map<String, dynamic> json) =>
      _$NewsLikeFromJson(json);
}
