import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/horizontal_slider.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/movieComponent/viewModel/movies_viewmodel.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/movie_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class MoviesHomeWidget extends ConsumerStatefulWidget {
  const MoviesHomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoviesHomeWidgetState();
}

class _MoviesHomeWidgetState extends ConsumerState<MoviesHomeWidget> {
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
      return HorizontalSlider<Movie>.height(
        data: snapshot.data!,
        height: MediaQuery.of(context).size.height * 0.34,
        child: (data) {
          return MovieCardView(movie: data);
        },
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
          child: DelayedLoadingIndicator(name: context.localizations.movies),
        ),
      );
    }
  }
}
