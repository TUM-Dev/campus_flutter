import 'package:campus_flutter/base/networking/apis/google/protobuf/timestamp.pb.dart';
import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/main.dart';

class MovieService {
  static Future<(DateTime?, List<Movie>)> fetchMovies(
    bool forcedRefresh,
  ) async {
    final start = DateTime.now();
    GrpcClient grpcClient = getIt<GrpcClient>();
    final response = await grpcClient.listMovies(
      ListMoviesRequest(
        oldestDateAt: Timestamp.fromDateTime(
          DateTime(start.year, start.month, start.day),
        ),
      ),
    );
    return (start, response.movies);
  }
}
