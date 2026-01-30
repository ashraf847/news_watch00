import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

enum UserType { reporter, visitor }

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    String? id,
    required String name,
    required String email,
    required UserType userType,
    DateTime? birthDate,
    String? profilePictureUrl,
    List<String>? nickNames,
    String? phone,
    @Default(0) int? stars,
    @Default("") String? fcmToken,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
