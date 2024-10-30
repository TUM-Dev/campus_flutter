import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/campusComponent/view/movie/movie_grid_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:campus_flutter/campusComponent/view/movie/movie_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MovieWidgetView extends ConsumerStatefulWidget {
  const MovieWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoviesHomeWidgetState();
}

class _MoviesHomeWidgetState extends ConsumerState<MovieWidgetView> {
  @override
  void initState() {
    ref.read(movieViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(movieViewModel).movies,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return WidgetFrameView(
            titleWidget: Row(
              children: [
                Text(
                  "TU Film",
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                InkWell(
                  child: Text(
                    context.tr("all"),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => context.push(movies),
                ),
              ],
            ),
            child: body(snapshot),
          );
        }
      },
    );
  }

  Widget body(AsyncSnapshot<List<Movie>?> snapshot) {
    if (snapshot.hasData) {
      return MovieGridView(
        movies: snapshot.data!.take(4).toList(),
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        crossAxisCount: 2,
        withinScrollView: true,
      );
      /*return GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        crossAxisCount: 2,
        mainAxisSpacing: context.padding,
        crossAxisSpacing: context.padding,
        childAspectRatio: 250 / 470,
        children: [
          for (var data in snapshot.data!.take(4).toList())
            MovieCardView(movie: data),
        ],
      );*/
    } else if (snapshot.hasError) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.34,
        child: ErrorHandlingRouter(
          error: snapshot.error!,
          errorHandlingViewType: ErrorHandlingViewType.textOnly,
          retry: (() => ref.read(movieViewModel).fetch(true)),
        ),
      );
    } else {
      return Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.34,
          child: DelayedLoadingIndicator(name: context.tr("movies")),
        ),
      );
    }
  }
}
