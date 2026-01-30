import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/auth/data/firestore_app_user_repository.dart';
import '../domain/app_user.dart';

var streamUserProvider = StreamProvider.family<AppUser?, String>(
  (ref, userId) {
    return ref.watch(firestoreAppUserRepositoryProvider).streamUserById(
          id: userId,
        );
  },
);
