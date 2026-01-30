import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_watch/home_management/application/get_top_10_news_provider.dart';
import 'package:news_watch/translation.dart';
import 'news_card_component.dart';

class TopNewsListComponent extends ConsumerWidget {
  const TopNewsListComponent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(getTop10NewsProvider);
    return news.when(
      data: (data) {
        return data.isEmpty
            ? Center(
                child: Text("No Data".i18n),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  // ignore: unused_result
                  ref.refresh(getTop10NewsProvider);
                },
                child: ListView(
                  children: [
                    if (kIsWeb)
                      ElevatedButton(
                        onPressed: () {
                          // ignore: unused_result
                          ref.refresh(getTop10NewsProvider);
                        },
                        child: Text("Refresh".i18n),
                      ),
                    SingleChildScrollView(
                      child: Column(
                        children: data
                            .map(
                              (e) => NewsCardComponent(news: e),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
    );
  }
}
