import 'package:campus_flutter/campusComponent/view/shared/campus_carousel_inset.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_section_heading.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/campusComponent/view/news/news_card_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/news_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const newsWidgetHeight = 300.00;

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
    return WidgetFrameView(
      titleWidget: CampusSectionHeading(
        title: context.tr("news"),
        onMore: () => context.push(news),
      ),
      child: StreamBuilder(
        stream: ref.watch(newsViewModel).news,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final fiveNews = ref.read(newsViewModel).latestFiveNews();
            if (fiveNews.isNotEmpty) {
              return SizedBox(
                height:
                    newsWidgetHeight +
                    (MediaQuery.textScalerOf(context).scale(14) - 14) * 5,
                child: LayoutBuilder(
                  builder: (context, constraints) => CampusCarouselInset(
                    child: CarouselView(
                      itemExtent: (constraints.maxWidth * 0.86).clamp(
                        240.0,
                        380.0,
                      ),
                      itemSnapping: false,
                      shrinkExtent: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      children: [
                        for (var news in fiveNews)
                          NewsCardView(news: news, width: 0, isCarousel: true),
                      ],
                      onTap: (index) {
                        final news = fiveNews[index];
                        final imageUrl =
                            news.imageUrl.toString().contains("src_1.png")
                            ? news.link.toString()
                            : news.imageUrl.toString();
                        if (imageUrl.isNotEmpty) {
                          context.push(networkImage, extra: (imageUrl, null));
                        }
                      },
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 300,
                child: Card(
                  child: Center(
                    child: Text(
                      context.tr("noEntriesFound", args: [context.tr("news")]),
                    ),
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return SizedBox(
              height: 300,
              child: Card(
                child: ErrorHandlingRouter(
                  error: snapshot.error!,

                  errorHandlingViewType: ErrorHandlingViewType.textOnly,
                  retry: (() => ref.read(newsViewModel).fetch(true)),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: 300,
              child: Card(
                child: DelayedLoadingIndicator(name: context.tr("news")),
              ),
            );
          }
        },
      ),
    );
  }
}
