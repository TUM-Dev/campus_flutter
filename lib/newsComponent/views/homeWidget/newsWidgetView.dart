import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/helpers/horizontalSlider.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/newsComponent/views/newsCardView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsWidgetView extends ConsumerStatefulWidget {
  const NewsWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsWidgetViewState();
}

class _NewsWidgetViewState extends ConsumerState<NewsWidgetView> {
  @override
  void initState() {
    ref.read(newsViewModel).getNewsSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(title: "Latest News", child:
    StreamBuilder(
      stream: ref.watch(newsViewModel).newsSources,
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          final fiveNews = ref.watch(newsViewModel).latestFiveNews();
          return HorizontalSlider(data: fiveNews, height: 300, child: (news) {
            return NewsCardView(news: news);
          });
        } else if (snapshot.hasError) {
          return const SizedBox(height: 300, child: Card(child: Center(child: Text("Error"))));
        } else {
          return const DelayedLoadingIndicator(name: "News");
        }
        }
    ));
  }
}