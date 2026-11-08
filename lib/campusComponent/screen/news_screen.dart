import 'package:campus_flutter/campusComponent/view/news/news_card_view.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_collection_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/news_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  @override
  void initState() {
    super.initState();
    final model = ref.read(newsViewModel);
    if (model.newsBySource.value == null && !model.newsBySource.hasError) {
      model.fetch(false);
    }
  }

  Future<void> _refresh() async => await ref.read(newsViewModel).fetch(true);

  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: ref.watch(newsViewModel).newsBySource,
    builder: (context, snapshot) {
      final sources = snapshot.data?.entries.toList() ?? [];
      Widget collection(int? index) {
        final items = index == null ? null : sources[index].value;
        return CampusCollectionView(
          label: context.tr('news'),
          icon: Icons.newspaper_outlined,
          storageKey: index == null
              ? 'news-empty'
              : 'news-${sources[index].key}',
          onRefresh: _refresh,
          hasData: snapshot.hasData,
          error: snapshot.error,
          stackTrace: snapshot.stackTrace,

          itemCount: items?.length ?? 0,
          minimumCardWidth: 300,
          cardAspectRatio: 1.1,
          itemBuilder: (context, index) =>
              NewsCardView(news: items![index], width: 0),
        );
      }

      return DefaultTabController(
        length: sources.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.tr('news')),
            actions: [
              IconButton(
                onPressed: _refresh,
                tooltip: context.tr('refresh'),
                icon: const Icon(Icons.refresh),
              ),
            ],
            bottom: sources.isEmpty
                ? null
                : TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [for (final source in sources) Tab(text: source.key)],
                  ),
          ),
          body: sources.isEmpty
              ? collection(null)
              : TabBarView(
                  children: [
                    for (var index = 0; index < sources.length; index++)
                      collection(index),
                  ],
                ),
        ),
      );
    },
  );
}
