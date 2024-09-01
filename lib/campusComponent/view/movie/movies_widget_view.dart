import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/movies_viewmodel.dart';
import 'package:campus_flutter/campusComponent/view/movie/movie_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          return WidgetFrameView(title: "TU Film", child: body(snapshot));
        }
      },
    );
  }

  Widget body(AsyncSnapshot<List<Movie>?> snapshot) {
    if (snapshot.hasData) {
      final height = MediaQuery.of(context).size.height * 0.34;
      final width = height * 250 / 470;
      return SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 11),
          child: CarouselView(
            itemExtent: width,
            shrinkExtent: width,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            children: [
              for (var data in snapshot.data!)
                MovieCardView(
                  movie: data,
                  isCarousel: true,
                ),
            ],
            onTap: (index) => UrlLauncher.urlString(
              snapshot.data![index].additionalInformationUrl,
              ref,
            ),
          ),
        ),
      );
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
