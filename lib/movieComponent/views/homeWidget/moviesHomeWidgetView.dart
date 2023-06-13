import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/helpers/horizontalSlider.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiError.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widgetTitleChild.dart';
import 'package:campus_flutter/movieComponent/model/movie.dart';
import 'package:campus_flutter/movieComponent/viewModel/movieViewModel.dart';
import 'package:campus_flutter/movieComponent/views/homeWidget/movieCardView.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class MoviesHomeWidget extends StatefulWidget {
  const MoviesHomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MoviesHomeWidgetState();
}

class _MoviesHomeWidgetState extends State<MoviesHomeWidget> {
  @override
  void initState() {
    Provider.of<MovieViewModel>(context, listen: false).getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetTitleChild(title: "TU Film", child:
    StreamBuilder(
        stream: Provider.of<MovieViewModel>(context, listen: true).movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.movies.isEmpty) {
              return const SizedBox.shrink();
            } else {
              return SizedBox(height: MediaQuery.of(context).size.height * 0.34, child:
              HorizontalSlider<Movie>(
                  data: snapshot.data!.movies,
                  child: (data) {
                    return MovieCardView(movie: data);
                  }
              ));
            }
          } else if (snapshot.hasError) {
            if (snapshot.error is TumCabeApiError) {
              final error = snapshot.error as TumCabeApiError;
              return const SizedBox.shrink();
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const DelayedLoadingIndicator(name: "Movies");
          }
        }));
  }
}
