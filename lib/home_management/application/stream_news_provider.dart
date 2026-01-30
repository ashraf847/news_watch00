import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import '../../core/application/search_text_provider.dart';
import '../data/firestore_news_repository.dart';

final streamNewsProvider = StreamProvider(
  (ref) {
    var searchText = ref.watch(searchTextProvider);
    return ref
        .watch(firestoreNewsRepositoryProvider)
        .getNewsWithUserAndLikesStream(
          currentUserId: ref.watch(authNotifierProvider)!.id!,
          searchText: searchText,
        );
  },
);
