import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/helpers/horizontalSlider.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiError.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/movieCardView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesHomeWidget extends ConsumerStatefulWidget {
  const MoviesHomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesHomeWidgetState();
}

class _MoviesHomeWidgetState extends ConsumerState<MoviesHomeWidget> {
  @override
  void initState() {
    ref.read(movieViewModel).getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(title: "TU Film", child:
    StreamBuilder(
        stream: ref.watch(movieViewModel).movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.movies.isEmpty) {
              return const SizedBox.shrink();
            } else {
              return HorizontalSlider<Movie>(
                  data: snapshot.data!.movies,
                  height: MediaQuery.of(context).size.height * 0.34,
                  child: (data) {
                    return MovieCardView(movie: data);
                  }
              );
            }
          } else if (snapshot.hasError) {
            if (snapshot.error is TumCabeApiError) {
              final error = snapshot.error as TumCabeApiError;
              return const SizedBox.shrink();
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return Card(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: const DelayedLoadingIndicator(name: "Movies")));
          }
        }));
  }
}
