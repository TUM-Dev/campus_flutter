import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/main.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

class NewsService {
  static Future<(DateTime?, List<News>)> fetchRecentNews(
    bool forcedRefresh,
  ) async {
    final start = DateTime.now();
    GrpcClient grpcClient = getIt<GrpcClient>();
    final news = await grpcClient.listNews(
      ListNewsRequest(
        oldestDateAt: Timestamp.fromDateTime(
          DateTime(
            start.year,
            start.month,
            start.day,
          ).subtract(const Duration(days: 30)),
        ),
      ),
    );
    return (start, news.news);
  }

  static Future<(DateTime?, List<News>)> fetchNews(bool forcedRefresh) async {
    final start = DateTime.now();
    GrpcClient grpcClient = getIt<GrpcClient>();
    final news = await grpcClient.listNews(ListNewsRequest());
    return (start, news.news);
  }
}
