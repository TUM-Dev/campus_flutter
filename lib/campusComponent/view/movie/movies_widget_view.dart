import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/grid_utility.dart';
import 'package:campus_flutter/campusComponent/view/movie/movie_grid_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
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
                    context.tr("more"),
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
        movies:
            snapshot.data!
                .take(GridUtility.campusNumberOfItems(context))
                .toList(),
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        crossAxisCount: GridUtility.campusPaddedCrossAxisCount(context),
        withinScrollView: true,
      );
    } else if (snapshot.hasError) {
      return AspectRatio(
        aspectRatio: 2,
        child: Card(
          child: ErrorHandlingRouter(
            error: Error(),
            errorHandlingViewType: ErrorHandlingViewType.textOnly,
            retry: (() => ref.read(movieViewModel).fetch(true)),
          ),
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 2,
        child: Card(child: DelayedLoadingIndicator(name: context.tr("movies"))),
      );
    }
  }
}
