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

  static Movie? _parseMovie(dynamic item) {
    final title = item.querySelector('h1')?.text.trim() ?? '';
    if (title.isEmpty) return null;
    final img = item.querySelector('img')?.attributes['src'] ?? '';
    final dateText = item.querySelector('.datum')?.text.trim() ?? '';
    final timeText = item.querySelector('.uhrzeit')?.text.trim() ?? '';
    final room = item.querySelector('.raum, .filmraum')?.text.trim() ?? '';
    DateTime? movieDate;
    final dateMatch = RegExp(r'(\d{2})\.(\d{2})\.(\d{4})').firstMatch(dateText);
    if (dateMatch != null) {
      final day = int.parse(dateMatch.group(1)!);
      final month = int.parse(dateMatch.group(2)!);
      final year = int.parse(dateMatch.group(3)!);
      final timeMatch = RegExp(r'(\d{1,2}):(\d{2})').firstMatch(timeText);
      final hour = timeMatch != null ? int.parse(timeMatch.group(1)!) : 18;
      final minute = timeMatch != null ? int.parse(timeMatch.group(2)!) : 0;
      movieDate = DateTime(year, month, day, hour, minute);
    }
    final coverUrl = img.isEmpty
        ? ''
        : (img.startsWith('http')
              ? img
              : 'https://www.unifilm.de/${img.replaceFirst(RegExp(r'^/'), '')}');
    return Movie(
      title: 'Campuskino Heilbronn: $title',
      date: movieDate != null ? Timestamp.fromDateTime(movieDate) : null,
      coverUrl: coverUrl,
      location: room,
      additionalInformationUrl:
          'https://www.unifilm.de/studentenkinos/heilbronn',
    );
  }

  static Future<(DateTime?, List<Movie>)> _fetchHeilbronn(
    DateTime currentDate,
  ) async {
    final response = await Dio().get<String>(
      'https://www.unifilm.de/studentenkinos/heilbronn',
    );
    final document = html_parser.parse(response.data ?? '');
    final movies = document
        .querySelectorAll('.film-showcase')
        .map(_parseMovie)
        .whereType<Movie>()
        .where((m) => !m.hasDate() || m.date.toDateTime().isAfter(currentDate))
        .toList();
    // Fallback: die Seite direkt verlinken wenn keine Filme geparst wurden
    if (movies.isEmpty) {
      movies.add(
        Movie(
          title: 'Campuskino Heilbronn',
          date: Timestamp.fromDateTime(currentDate),
          additionalInformationUrl:
              'https://www.unifilm.de/studentenkinos/heilbronn',
        ),
      );
    }
    return (currentDate, movies);
  }
}
