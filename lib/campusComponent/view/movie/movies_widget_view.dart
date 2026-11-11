import 'package:campus_flutter/campusComponent/view/shared/campus_carousel_inset.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_section_heading.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/campusComponent/view/movie/movie_card_view.dart';
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
            titleWidget: CampusSectionHeading(
              title: "TU Film",
              onMore: () => context.push(movies),
            ),
            child: body(snapshot),
          );
        }
      },
    );
  }

  Widget body(AsyncSnapshot<List<Movie>?> snapshot) {
    if (snapshot.hasData) {
      return SizedBox(
        height: 320 + (MediaQuery.textScalerOf(context).scale(14) - 14) * 3,
        child: CampusCarouselInset(
          child: CarouselView(
            itemExtent: 180,
            shrinkExtent: 180,
            itemSnapping: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enableSplash: false,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            children: [
              for (final movie in snapshot.data!.take(10))
                MovieCardView(movie: movie),
            ],
          ),
        ),
      );
    } else if (snapshot.hasError) {
      return AspectRatio(
        aspectRatio: 2,
        child: Card(
          child: ErrorHandlingRouter(
            error: snapshot.error!,
            stackTrace: snapshot.stackTrace,

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
