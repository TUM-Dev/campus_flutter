import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/horizontal_slider.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/generic_stream_builder.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/movie_card_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/theme.dart';

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
    return WidgetFrameView(
        title: "TU Film",
        child: GenericStreamBuilder<List<Movie>>(
            stream: ref.watch(movieViewModel).movies,
            dataBuilder: (context, data) {
              if (data.isEmpty) {
                return Card(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.34,
                        child: Center(
                            child: Text(context.localizations.noMoviesFound))));
              } else {
                return LayoutBuilder(builder: (context, constraints) {
                  return HorizontalSlider<Movie>.height(
                      data: data,
                      height: MediaQuery.of(context).size.height * 0.34,
                      child: (data) {
                        return MovieCardView(
                            movie: data, width: constraints.maxWidth * 0.4);
                      });
                });
              }
            },
            errorBuilder: (context, error) => Card(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: ErrorHandlingView(
                        error: error,
                        errorHandlingViewType: ErrorHandlingViewType.textOnly,
                        retry: ref.read(movieViewModel).fetch))),
            loadingBuilder: (context) => Card(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: DelayedLoadingIndicator(
                        name: context.localizations.movies)))));
  }
}
