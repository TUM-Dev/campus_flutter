import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/view/movie/movie_card_view.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_collection_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({super.key});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    final model = ref.read(movieViewModel);
    if (model.movies.value == null && !model.movies.hasError) {
      model.fetch(false);
    }
  }

  Future<void> _refresh() async => await ref.read(movieViewModel).fetch(true);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('TU Film'),
      actions: [
        IconButton(
          onPressed: _refresh,
          tooltip: context.tr('refresh'),
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: () =>
              UrlLauncher.urlString('https://www.tu-film.de/', ref),
          tooltip: context.tr('openWebsite'),
          icon: const Icon(Icons.open_in_new),
        ),
      ],
    ),
    body: StreamBuilder(
      stream: ref.watch(movieViewModel).movies,
      builder: (context, snapshot) => CampusCollectionView(
        label: context.tr('movies'),
        icon: Icons.local_movies_outlined,
        onRefresh: _refresh,
        hasData: snapshot.hasData,
        error: snapshot.error,

        itemCount: snapshot.data?.length ?? 0,
        minimumCardWidth: 160,
        cardAspectRatio: 250 / 470,
        itemBuilder: (context, index) =>
            MovieCardView(movie: snapshot.data![index]),
      ),
    ),
  );
}
