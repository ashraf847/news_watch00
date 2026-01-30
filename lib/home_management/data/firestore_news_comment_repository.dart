import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/news_comment.dart';
import 'news_comment_repository.dart';

part 'firestore_news_comment_repository.g.dart';

@riverpod
FirestoreNewsCommentRepository firestoreNewsCommentRepository(Ref ref) {
  return FirestoreNewsCommentRepository();
}

class FirestoreNewsCommentRepository implements NewsCommentRepository {
  FirestoreNewsCommentRepository() {
    _firebase = FirebaseFirestore.instance;
  }

  late FirebaseFirestore _firebase;
  final String collectionName = "news_comments";

  @override
  Future<void> createNewsComment({required NewsComment newsComment}) async {
    try {
      String docId =
          newsComment.id ?? _firebase.collection(collectionName).doc().id;

      await _firebase.collection(collectionName).doc(docId).set(
            newsComment.copyWith(id: docId).toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NewsComment?> readNewsComment({required String id}) async {
    try {
      DocumentSnapshot doc =
          await _firebase.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return NewsComment.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNewsComment({required NewsComment newsComment}) async {
    try {
      await _firebase
          .collection(collectionName)
          .doc(newsComment.id)
          .update(newsComment.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNewsComment({required String id}) async {
    try {
      await _firebase.collection(collectionName).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<CommentUser>> streamAllCommentsWithUsersForNews(
      {required String newsId}) {
    return _firebase
        .collection(collectionName)
        .where("newsId", isEqualTo: newsId)
        .orderBy("date", descending: true)
        .snapshots()
        .asyncMap((commentSnapshot) async {
      List<CommentUser> commentsWithUsers = [];

      for (var doc in commentSnapshot.docs) {
        NewsComment comment = NewsComment.fromJson(doc.data());

        DocumentSnapshot userDoc =
            await _firebase.collection("appUsers").doc(comment.userId).get();

        String userName = userDoc.exists
            ? (userDoc.data() as Map<String, dynamic>)["name"] ?? "Unknown"
            : "Unknown";

        commentsWithUsers
            .add(CommentUser(comment: comment, userName: userName));
      }

      return commentsWithUsers;
    });
  }
}
