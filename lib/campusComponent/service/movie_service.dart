import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/main.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

class MovieService {
  /// 0 = TU Film (gRPC), 1 = Campuskino Heilbronn (web scrape)
  static Future<(DateTime?, List<Movie>)> fetchMovies(
    bool forcedRefresh, [
    int cinema = 0,
  ]) async {
    final currentDate = DateTime.now();
    if (cinema == 1) {
      return _fetchHeilbronn(currentDate);
    }
    GrpcClient grpcClient = getIt<GrpcClient>();
    final response = await grpcClient.listMovies(
      ListMoviesRequest(oldestDateAt: Timestamp.fromDateTime(currentDate)),
    );
    return (currentDate, response.movies);
  }

  static Future<(DateTime?, List<Movie>)> _fetchHeilbronn(
    DateTime currentDate,
  ) async {
    final response = await Dio().get<String>(
      'https://www.unifilm.de/studentenkinos/heilbronn',
    );
    final document = html_parser.parse(response.data ?? '');
    final movies = <Movie>[];
    for (final item in document.querySelectorAll('.kino-movie-item, article.movie, .film-item, .screening-item')) {
      final title = item.querySelector('.movie-title, h2, h3, .title')?.text.trim() ?? '';
      final img = item.querySelector('img')?.attributes['src'] ?? '';
      final href = item.querySelector('a')?.attributes['href'] ?? '';
      if (title.isEmpty) continue;
      movies.add(Movie(
        title: 'Campuskino Heilbronn: $title',
        date: Timestamp.fromDateTime(currentDate),
        coverUrl: img.startsWith('http') ? img : 'https://www.unifilm.de$img',
        additionalInformationUrl: href.startsWith('http')
            ? href
            : 'https://www.unifilm.de$href',
      ));
    }
    // Fallback: die Seite direkt verlinken wenn keine Filme geparst wurden
    if (movies.isEmpty) {
      movies.add(Movie(
        title: 'Campuskino Heilbronn',
        date: Timestamp.fromDateTime(currentDate),
        additionalInformationUrl: 'https://www.unifilm.de/studentenkinos/heilbronn',
      ));
    }
    return (currentDate, movies);
  }
}
