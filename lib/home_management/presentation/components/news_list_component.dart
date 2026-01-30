import 'package:flutter/material.dart';
import 'package:news_watch/translation.dart';
import '../../domain/news.dart';
import 'news_card_component.dart';

class NewsListComponent extends StatelessWidget {
  const NewsListComponent({super.key, required this.news});
  final List<NewsWithUser> news;
  @override
  Widget build(BuildContext context) {
    return news.isEmpty
        ? Center(
            child: Text("No Data".i18n),
          )
        : SingleChildScrollView(
            child: Column(
              children: news
                  .map(
                    (e) => NewsCardComponent(news: e),
                  )
                  .toList(),
            ),
          );
  }
}
