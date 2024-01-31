import 'dart:convert';

import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';

import 'package:campus_flutter/movieComponent/service/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:rxdart/rxdart.dart';

final movieViewModel = Provider((ref) => MovieViewModel());

class MovieViewModel {
  BehaviorSubject<List<Movie>?> movies = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  Future fetch(bool forcedRefresh) async {
    return MovieService.fetchMovies(forcedRefresh).then(
      (response) async {
        lastFetched.add(response.$1);
        movies.add(response.$2);
        print(await HomeWidget.saveWidgetData<String>("news", "Hallo Welt!"));
        print(await HomeWidget.updateWidget(iOSName: "NewsWidget"));
      },
      onError: (error) => movies.addError(error),
    );
  }
}

extension MovieTitle on Movie {
  String get movieTitle {
    final titleParts = title.split(": ");
    return titleParts.length == 2 ? titleParts[1] : title;
  }
}
