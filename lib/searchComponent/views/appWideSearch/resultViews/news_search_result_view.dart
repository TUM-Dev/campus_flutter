import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/base/util/string_parser.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/news_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewsSearchResultView extends ConsumerWidget {
  const NewsSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<NewsSearchViewModel, NewsSearch>(
      searchCategory: SearchCategory.news,
      viewModel: newsSearchViewModel,
      body: (newsSearch) {
        final imageUrl =
            newsSearch.news.imageUrl.toString().contains("src_1.png")
                ? newsSearch.news.link.toString()
                : newsSearch.news.imageUrl.toString();
        return ListTile(
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: AspectRatio(
              aspectRatio: 2,
              child: CachedNetworkImage(
                height: 60,
                imageUrl: newsSearch.news.imageUrl,
                placeholder: (context, string) => Image.asset(
                  "assets/images/placeholders/news_placeholder.png",
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/placeholders/news_placeholder.png",
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(newsSearch.news.title),
          subtitle: Text(
            StringParser.dateFormatter(
              newsSearch.news.date.toDateTime(),
              context,
            ),
          ),
          onTap: () {
            if (imageUrl.isNotEmpty) {
              context.push(networkImage, extra: (imageUrl, null));
            }
          },
        );
      },
    );
  }
}
