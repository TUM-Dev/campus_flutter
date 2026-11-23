import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/main.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

class MovieService {
  /// 0 = TU Film (gRPC), 1 = Campuskino Heilbronn (gRPC)
  static Future<(DateTime?, List<Movie>)> fetchMovies(
    bool forcedRefresh, [
    int cinema = 0,
  ]) async {
    final currentDate = DateTime.now();
    GrpcClient grpcClient = getIt<GrpcClient>();
    final response = await grpcClient.listMovies(
      ListMoviesRequest(
        oldestDateAt: Timestamp.fromDateTime(currentDate),
        cinema: cinema == 1 ? .CAMPUSKINO_HEILBRONN : .TU_FILM,
      ),
    );
    return (currentDate, response.movies);
  }
}
