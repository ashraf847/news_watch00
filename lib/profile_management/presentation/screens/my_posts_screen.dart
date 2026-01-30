import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/translation.dart';
import '../../../home_management/presentation/components/simple_news_card_component.dart';
import '../../application/get_user_news_provider.dart';

class MyPostsScreen extends ConsumerWidget {
  const MyPostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var newsFuture = ref.watch(getUserNewsProvider);
    return Scaffold(
      appBar: AppBar(title: Text("My Posts".i18n)),
      body: newsFuture.when(
        data: (data) {
          return data.isEmpty
              ? Center(
                  child: Text("No Data".i18n),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: data
                        .map(
                          (e) => SimpleNewsCardComponent(news: e),
                        )
                        .toList(),
                  ),
                );
        },
        error: (error, stackTrace) {
          debugPrint(error.toString());
          return Text("Something Went Wrong".i18n);
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
