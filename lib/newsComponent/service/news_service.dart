import 'package:campus_flutter/base/networking/apis/google/protobuf/timestamp.pb.dart';
import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/main.dart';

class NewsService {
  static Future<(DateTime?, List<News>)> fetchRecentNews(
    bool forcedRefresh,
  ) async {
    final start = DateTime.now();
    GrpcClient restClient = getIt<GrpcClient>();
    final news = await restClient.listNews(
      ListNewsRequest(
        oldestDateAt: Timestamp.fromDateTime(
          DateTime(start.year, start.month, start.day)
              .subtract(const Duration(days: 30)),
        ),
      ),
    );
    return (start, news.news);
  }

  static Future<(DateTime?, List<News>)> fetchNews(bool forcedRefresh) async {
    final start = DateTime.now();
    GrpcClient restClient = getIt<GrpcClient>();
    final news = await restClient.listNews(ListNewsRequest());
    return (start, news.news);
  }
}
