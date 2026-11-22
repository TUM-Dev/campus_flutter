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

const _cinemas = <String, (String, String)>{
  'tuFilm': ('TU Film', 'https://www.tu-film.de/'),
  'campuskinoHeilbronn': (
    'Campuskino Heilbronn',
    'https://www.unifilm.de/studentenkinos/heilbronn',
  ),
};

class MovieViewModel {
  final BehaviorSubject<List<Movie>?> movies = BehaviorSubject.seeded(null);
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<int> selectedCinema;

  static const _defaultCinemaIndex = 0;

  MovieViewModel()
    : selectedCinema = BehaviorSubject.seeded(
        _readSavedCinema() ?? _defaultCinemaIndex,
      );

  static int? _readSavedCinema() {
    if (!getIt.isRegistered<UserPreferencesService>()) return null;
    try {
      return getIt<UserPreferencesService>().load(UserPreference.cinema)
          as int?;
    } catch (error) {
      debugPrint('Could not read the cinema preference: $error');
      return null;
    }
  }

  String get cinemaName => _cinemas.values.elementAt(selectedCinema.value).$1;
  String get cinemaWebsite =>
      _cinemas.values.elementAt(selectedCinema.value).$2;

  void setCinema(int? index) {
    selectedCinema.add(index ?? _defaultCinemaIndex);
    try {
      if (getIt.isRegistered<UserPreferencesService>()) {
        final preferences = getIt<UserPreferencesService>();
        if (index == null) {
          preferences.reset(UserPreference.cinema);
        } else {
          preferences.save(UserPreference.cinema, index);
        }
      }
    } catch (error) {
      debugPrint('Could not update the cinema preference: $error');
    }
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
    final saved = _readSavedCinema();
    return [
      ListTile(
        dense: true,
        title: Text(context.tr('closest')),
        trailing: saved == null ? const Icon(Icons.check) : null,
        onTap: () {
          setCinema(null);
          context.pop();
        },
      ),
      for (int i = 0; i < _cinemas.length; i++)
        ListTile(
          dense: true,
          title: Text(_cinemas.values.elementAt(i).$1),
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
