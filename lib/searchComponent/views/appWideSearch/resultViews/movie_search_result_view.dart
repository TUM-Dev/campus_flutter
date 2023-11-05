import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/movie_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MovieSearchResultView extends ConsumerWidget {
  const MovieSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<MovieSearchViewModel, MovieSearch>(
      searchCategory: SearchCategory.movie,
      viewModel: movieSearchViewModel,
      body: (movieSearch) => ListTile(
        title: Text(movieSearch.movie.title),
        subtitle: Text(
          DateFormat.yMd(context.localizations.localeName)
              .format(movieSearch.movie.date.toDateTime()),
        ),
      ),
    );
  }
}
