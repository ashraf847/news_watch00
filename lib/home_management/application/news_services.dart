import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_watch/auth/application/auth_notifier_provider.dart';
import 'package:news_watch/home_management/application/add_news_form_provider.dart';
import 'package:news_watch/home_management/data/firestore_news_repository.dart';
import 'package:news_watch/home_management/domain/news.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/data/firestore_app_user_repository.dart';
import '../../core/presentation/widgets/rich_text_widget.dart';

part 'news_services.g.dart';

@riverpod
NewsServices newsServices(Ref ref) {
  return NewsServices(
    firestoreNewsRepository: ref.read(firestoreNewsRepositoryProvider),
    firestoreAppUserRepository: ref.read(firestoreAppUserRepositoryProvider),
    ref: ref,
  );
}

class NewsServices {
  final FirestoreNewsRepository firestoreNewsRepository;
  final FirestoreAppUserRepository firestoreAppUserRepository;
  final Ref ref;
  NewsServices(
      {required this.firestoreNewsRepository,
      required this.firestoreAppUserRepository,
      required this.ref});

  Future<News?> createAndGetNews({required News news}) async {
    var id = await firestoreNewsRepository.createNews(news: news);

    var res = firestoreNewsRepository.readNews(id: id);
    return res;
  }

  void showImagePicker(BuildContext context, WidgetRef ref) {
    final ImagePicker picker = ImagePicker();
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'.i18n),
              onTap: () async {
                final pickedFile =
                    await picker.pickImage(source: ImageSource.camera);

                ref.read(imgFileProvider.notifier).state =
                    File(pickedFile!.path);
                // ignore: use_build_context_synchronously
                context.pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'.i18n),
              onTap: () async {
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);
                ref.read(imgFileProvider.notifier).state =
                    File(pickedFile!.path);
                // ignore: use_build_context_synchronously
                context.pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.remove),
              title: Text('Remove Picture'.i18n),
              onTap: () async {
                ref.read(imgFileProvider.notifier).state = null;
                // ignore: use_build_context_synchronously
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> createNews({required FormGroup form}) async {
    try {
      BotToast.showLoading();
      var imageFile = ref.read(imgFileProvider);
      // ignore: prefer_typing_uninitialized_variables
      var imageUrl;
      if (imageFile != null) {
        // imageUrl = await firestoreNewsRepository.uploadImage(
        //   imageFile: imageFile,
        //   folderPath: "News",
        // );
      }

      // Get the Delta object from Quill editor
      var delta = ref.read(richTextProvider).document.toDelta();

      // Convert Delta to JSON format (List of Map)
      String deltaJsonString = jsonEncode(delta.toJson());

      News n = News(
          userId: ref.read(authNotifierProvider)!.id!,
          title: form.control("head").value,
          details: deltaJsonString,
          category: Category.values
              .where(
                  (element) => element.name == form.control("category").value)
              .first,
          date: DateTime.now(),
          profilePictureUrl: imageUrl,
          tags: form.control("tags").value);
      await firestoreNewsRepository.createNews(news: n); // Data

      // Update User
      var currentUser = await firestoreAppUserRepository.readUser(
          id: ref.read(authNotifierProvider)!.id!); // Data
      if (currentUser != null) {
        await firestoreAppUserRepository.updateUser(
            appUser: currentUser.copyWith(stars: (currentUser.stars ?? 0) + 1));
      }
      BotToast.showNotification(
        subtitle: (cancelFunc) => Text("❤️"),
        title: (cancelFunc) => Text("News added".i18n),
      );
    } catch (e) {
      BotToast.showText(text: "Something Went Wrong".i18n);
    }
    BotToast.closeAllLoading();
  }
}
