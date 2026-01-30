import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/home_management/domain/news.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/domain/app_user.dart';
import 'news_repository.dart';

part 'firestore_news_repository.g.dart';

@riverpod
FirestoreNewsRepository firestoreNewsRepository(Ref ref) {
  return FirestoreNewsRepository();
}

class FirestoreNewsRepository implements NewsRepository {
  FirestoreNewsRepository() {
    _firbase = FirebaseFirestore.instance;
  }

  // ignore: unused_field
  late FirebaseFirestore _firbase;
  final String collectionName = "news";

  @override
  Future<String> createNews({required News news}) async {
    try {
      String docId = news.id ?? _firbase.collection(collectionName).doc().id;

      await _firbase.collection(collectionName).doc(docId).set(
            news.copyWith(id: docId).toJson(),
          );
      return docId;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNews({required String id}) async {
    try {
      await _firbase.collection(collectionName).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<News?> readNews({required String id}) async {
    try {
      DocumentSnapshot doc =
          await _firbase.collection(collectionName).doc(id).get();
      if (doc.exists) {
        return News.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNews({required News news}) async {
    try {
      await _firbase.collection(collectionName).doc(news.id).update(
            news.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> uploadFile({
    required File file,
    required String folderPath,
  }) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef =
          FirebaseStorage.instance.ref().child('$folderPath/$fileName.jpg');

      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;

      // Get Image URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Save URL to the reactive form
      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<News>> streamAllNews() {
    try {
      return _firbase
          .collection(collectionName)
          .orderBy("date", descending: true)
          .snapshots()
          .map((lstOfNews) {
        return lstOfNews.docs.map((e) => News.fromJson(e.data())).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<News>> getUserNews({required String userId}) async {
    try {
      return await _firbase
          .collection(collectionName)
          .orderBy("date", descending: true)
          .where("userId", isEqualTo: userId)
          .get()
          .then(
        (value) {
          return value.docs.map((e) => News.fromJson(e.data())).toList();
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<NewsWithUser>> getNewsWithUserAndLikesStream(
      {required String currentUserId, required String searchText}) {
    final newsStream = _firbase
        .collection(collectionName)
        .orderBy("date", descending: true)
        .snapshots();

    return newsStream.asyncMap(
      (newsSnapshot) async {
        final List<NewsWithUser> combinedData = [];

        for (var newsDoc in newsSnapshot.docs) {
          // الخبر
          final newsData = newsDoc.data();
          final userId = newsData['userId'];

          // المستخدم
          final userDoc =
              await _firbase.collection('appUsers').doc(userId).get();

          final userData = userDoc.data() ?? {};

          final likeSnapshot = await _firbase
              .collection('news_likes')
              .where('newsId', isEqualTo: newsDoc.id)
              .where('userId', isEqualTo: currentUserId)
              .get();

          final bool isLiked = likeSnapshot.docs.isNotEmpty;

          // Combine the data
          combinedData.add(
            NewsWithUser(
              news: News.fromJson(newsData),
              writer: AppUser.fromJson(userData),
              liked: isLiked,
            ),
          );
        }

        return combinedData
            .where(
              (element) =>
                  element.news.title
                      .toLowerCase()
                      .contains(searchText.toLowerCase()) ||
                  element.news.title
                      .toLowerCase()
                      .contains(searchText.toLowerCase()),
            )
            .toList();
      },
    );
  }

  @override
  Future<List<NewsWithUser>> getTop10NewsWithUser({
    required String currentUserId,
    required String searchText,
  }) async {
    try {
      CollectionReference newsRef = _firbase.collection(collectionName);

      QuerySnapshot querySnapshot = await newsRef
          .orderBy('numberOfLikes', descending: true)
          .orderBy('numberOfComments', descending: true)
          .limit(10)
          .get();

      List<NewsWithUser> topNewsWithUsers = [];
      for (var doc in querySnapshot.docs) {
        var newsData = doc.data() as Map<String, dynamic>;

        DocumentSnapshot userSnapshot =
            await _firbase.collection('appUsers').doc(newsData['userId']).get();

        var writerData = userSnapshot.data() as Map<String, dynamic>;

        final likeSnapshot = await _firbase
            .collection('news_likes')
            .where('newsId', isEqualTo: newsData['id'])
            .where('userId', isEqualTo: currentUserId)
            .get();

        final bool isLiked = likeSnapshot.docs.isNotEmpty;

        topNewsWithUsers.add(
          NewsWithUser(
            news: News.fromJson(newsData),
            writer: AppUser.fromJson(writerData),
            liked: isLiked,
          ),
        );
      }

      return topNewsWithUsers
          .where(
            (element) =>
                element.news.title
                    .toLowerCase()
                    .contains(searchText.trim().toLowerCase()) ||
                element.news.details
                    .toLowerCase()
                    .contains(searchText.trim().toLowerCase()),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Stream<NewsWithUser?> streamNews({required String id, required userId}) {
    return _firbase
        .collection(collectionName)
        .doc(id)
        .snapshots()
        .asyncMap((newsDoc) async {
      if (newsDoc.exists) {
        final newsData = newsDoc.data() as Map<String, dynamic>;
        final userId = newsData['userId'];
        final userSnapshot =
            await _firbase.collection('appUsers').doc(userId).get();
        final userData = userSnapshot.data() as Map<String, dynamic>;
        final likeSnapshot = await _firbase
            .collection('news_likes')
            .where('newsId', isEqualTo: newsDoc.id)
            .where('userId', isEqualTo: userId)
            .get();
        final bool isLiked = likeSnapshot.docs.isNotEmpty;
        return NewsWithUser(
          news: News.fromJson(newsData),
          writer: AppUser.fromJson(userData),
          liked: isLiked,
        );
      } else {
        return null;
      }
    });
  }
}
