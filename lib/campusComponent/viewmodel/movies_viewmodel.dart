import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/campusComponent/service/movie_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rxdart/rxdart.dart';

final movieViewModel = Provider((ref) => MovieViewModel());

/// 0 = TU Film, 1 = Campuskino Heilbronn
const _cinemaNames = ['TU Film', 'Campuskino Heilbronn'];
const _cinemaWebsites = [
  'https://www.tu-film.de/',
  'https://www.unifilm.de/studentenkinos/heilbronn',
];

class MovieViewModel {
  final BehaviorSubject<List<Movie>?> movies = BehaviorSubject.seeded(null);
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<int> selectedCinema = BehaviorSubject.seeded(
    (getIt<UserPreferencesService>().load(UserPreference.cinema) as int?) ?? 0,
  );

  String get cinemaName => _cinemaNames[selectedCinema.value];
  String get cinemaWebsite => _cinemaWebsites[selectedCinema.value];

  void setCinema(int index) {
    selectedCinema.add(index);
    getIt<UserPreferencesService>().save(UserPreference.cinema, index);
    fetch(true);
  }

  Future fetch(bool forcedRefresh) async {
    return MovieService.fetchMovies(forcedRefresh, selectedCinema.value).then(
      (response) {
        lastFetched.add(response.$1);
        movies.add(response.$2);
      },
      onError: (Object error, StackTrace stack) =>
          movies.addError(error, stack),
    );
  }

  List<ListTile> getCinemaEntries(BuildContext context) {
    final saved = getIt<UserPreferencesService>().load(UserPreference.cinema) as int?;
    return [
      ListTile(
        dense: true,
        title: Text(context.tr('closest')),
        trailing: saved == null ? const Icon(Icons.check) : null,
        onTap: () {
          getIt<UserPreferencesService>().reset(UserPreference.cinema);
          selectedCinema.add(0);
          fetch(true);
          context.pop();
        },
      ),
      for (int i = 0; i < _cinemaNames.length; i++)
        ListTile(
          dense: true,
          title: Text(_cinemaNames[i]),
          trailing: saved == i ? const Icon(Icons.check) : null,
          onTap: () {
            setCinema(i);
            context.pop();
          },
        ),
    ];
  }
}

extension MovieTitle on Movie {
  String get movieTitle {
    final titleParts = title.split(': ');
    return titleParts.length == 2 ? titleParts[1] : title;
  }
}
