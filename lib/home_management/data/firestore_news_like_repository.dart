import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/news_like.dart';
import 'news_like_repository.dart';

part 'firestore_news_like_repository.g.dart';

@riverpod
FirestoreNewsLikeRepository firestoreNewsLikeRepository(Ref ref) {
  return FirestoreNewsLikeRepository();
}

class FirestoreNewsLikeRepository implements NewsLikeRepository {
  FirestoreNewsLikeRepository() {
    _firebase = FirebaseFirestore.instance;
  }

  late FirebaseFirestore _firebase;
  final String collectionName = "news_likes";

  @override
  Future<void> createNewsLike({required NewsLike newsLike}) async {
    try {
      String docId =
          newsLike.id ?? _firebase.collection(collectionName).doc().id;

      await _firebase.collection(collectionName).doc(docId).set(
            newsLike.copyWith(id: docId).toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NewsLike?> readNewsLike({required String id}) async {
    try {
      DocumentSnapshot doc =
          await _firebase.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return NewsLike.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNewsLike({required NewsLike newsLike}) async {
    try {
      await _firebase
          .collection(collectionName)
          .doc(newsLike.id)
          .update(newsLike.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNewsLike({required String id}) async {
    try {
      await _firebase.collection(collectionName).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NewsLike?> getNewsLikeByUserIdNewsId({
    required String userId,
    required String newsId,
  }) async {
    try {
      return await _firebase
          .collection(collectionName)
          .where("userId", isEqualTo: userId)
          .where("newsId", isEqualTo: newsId)
          .get()
          .then(
        (value) {
          if (value.docs.isEmpty) {
            return null;
          } else {
            return NewsLike.fromJson(value.docs.first.data());
          }
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override

  Future<void> deleteNewsLikeByUserIdAndNewsId({
    required String userId,
    required String newsId,
  }) async {
    try {
      return await _firebase
          .collection(collectionName)
          .where("userId", isEqualTo: userId)
          .where("newsId", isEqualTo: newsId)
          .get()
          .then(
        (value) async {
          for (var element in value.docs) {
            await deleteNewsLike(id: element.id);
          }
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
