import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:news_watch/core/application/search_text_provider.dart';
import 'package:news_watch/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:news_watch/home_management/domain/news.dart';
import 'package:news_watch/home_management/presentation/components/top_news_list_component.dart';
import 'package:news_watch/translation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../application/stream_news_provider.dart';
import '../components/news_list_component.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var newsStream = ref.watch(streamNewsProvider);
    return ReactiveForm(
      formGroup: FormGroup({
        "name": FormControl<String>(),
        "type": FormControl<String>(),
        "poll": FormControl<String>(value: "Zero"),
      }),
      child: Column(
        children: [
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ReactiveForm(
              formGroup: FormGroup({
                "search":
                    FormControl<String>(value: ref.read(searchTextProvider)),
              }),
              child: ReactiveTextInputWidget(
                inputStyle: InputStyle.outlined,
                hint: "Search".i18n,
                controllerName: "search",
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: newsStream.when(
              data: (data) {
                var allNews = data;
                var politicNews = data
                    .where(
                        (element) => element.news.category == Category.politics)
                    .toList();
                var techNews = data
                    .where((element) => element.news.category == Category.tech)
                    .toList();
                var healthyNews = data
                    .where(
                        (element) => element.news.category == Category.healthy)
                    .toList();
                var scinceNews = data
                    .where(
                        (element) => element.news.category == Category.science)
                    .toList();
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    TopNewsListComponent(),
                    NewsListComponent(news: allNews),
                    NewsListComponent(news: politicNews),
                    NewsListComponent(news: techNews),
                    NewsListComponent(news: healthyNews),
                    NewsListComponent(news: scinceNews),
                  ],
                );
              },
              error: (error, stackTrace) {
                return Text("Something Went Wrong".i18n);
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
            ),
          ),
        ],
      ),
    );
  }
}
