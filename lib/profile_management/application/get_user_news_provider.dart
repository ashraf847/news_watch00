import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import 'package:news_watch/home_management/data/firestore_news_repository.dart';

final getUserNewsProvider = FutureProvider.autoDispose(
  (ref) {
    var userId = ref.read(authNotifierProvider)!.id ?? "";
    return ref
        .read(firestoreNewsRepositoryProvider)
        .getUserNews(userId: userId);
  },
);
