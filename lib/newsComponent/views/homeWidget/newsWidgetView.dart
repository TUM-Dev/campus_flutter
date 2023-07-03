import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/horizontal_slider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
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
    ref.read(newsViewModel).fetch(false);
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
          if (fiveNews.isNotEmpty) {
            return LayoutBuilder(builder: (context, constraints) {
              return HorizontalSlider(data: fiveNews, height: 300, child: (news) {
                return NewsCardView(news: news, width: constraints.maxWidth * 0.8);
              });
            });
          } else {
            return const SizedBox(height: 300, child: Card(child: Center(child: Text("no news found"))));
          }
        } else if (snapshot.hasError) {
          return SizedBox(height: 300, child: Card(child: ErrorHandlingView(error: snapshot.error!, errorHandlingViewType: ErrorHandlingViewType.textOnly, retry: ref.read(newsViewModel).fetch)));
        } else {
          return const SizedBox(height: 300, child: Card(child: DelayedLoadingIndicator(name: "News")));
        }
        }
    ));
  }
}