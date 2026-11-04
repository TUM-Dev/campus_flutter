import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/networking/cache/grpc_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

Timestamp _timestamp(DateTime date) => Timestamp.fromDateTime(date.toUtc());

void main() {
  const path = "/api.Campus/List";
  final monday = DateTime.utc(2026, 11, 2);
  final friday = DateTime.utc(2026, 11, 6);

  group("cacheKey", () {
    test("is stable for movie requests with a moving time window", () {
      expect(
        GrpcCacheInterceptor.cacheKey(
          path,
          ListMoviesRequest(oldestDateAt: _timestamp(monday)),
        ),
        GrpcCacheInterceptor.cacheKey(
          path,
          ListMoviesRequest(oldestDateAt: _timestamp(friday)),
        ),
      );
    });

    test("is stable for news requests with a moving time window", () {
      expect(
        GrpcCacheInterceptor.cacheKey(
          path,
          ListNewsRequest(oldestDateAt: _timestamp(monday)),
        ),
        GrpcCacheInterceptor.cacheKey(
          path,
          ListNewsRequest(oldestDateAt: _timestamp(friday)),
        ),
      );
    });

    test("separates requests with and without a time window", () {
      expect(
        GrpcCacheInterceptor.cacheKey(
          path,
          ListNewsRequest(oldestDateAt: _timestamp(monday)),
        ),
        isNot(GrpcCacheInterceptor.cacheKey(path, ListNewsRequest())),
      );
    });

    test("separates requests that differ in other fields", () {
      expect(
        GrpcCacheInterceptor.cacheKey(
          path,
          ListNewsRequest(newsSource: 1, oldestDateAt: _timestamp(monday)),
        ),
        isNot(
          GrpcCacheInterceptor.cacheKey(
            path,
            ListNewsRequest(newsSource: 2, oldestDateAt: _timestamp(monday)),
          ),
        ),
      );
    });

    test("does not modify the request", () {
      final request = ListMoviesRequest(oldestDateAt: _timestamp(monday));
      GrpcCacheInterceptor.cacheKey(path, request);
      expect(request.hasOldestDateAt(), isTrue);
    });
  });

  group("applyTimeWindow", () {
    test("removes movies that are not newer than oldestDateAt", () {
      final reply = ListMoviesReply(
        movies: [
          Movie(title: "past", date: _timestamp(monday)),
          Movie(title: "boundary", date: _timestamp(friday)),
          Movie(title: "upcoming", date: _timestamp(friday.add(_oneDay))),
        ],
      );

      final result = GrpcCacheInterceptor.applyTimeWindow(
        reply,
        ListMoviesRequest(oldestDateAt: _timestamp(friday)),
      );

      expect(result.movies.map((movie) => movie.title), ["upcoming"]);
    });

    test("removes news that are not newer than oldestDateAt", () {
      final reply = ListNewsReply(
        news: [
          News(title: "old", date: _timestamp(monday)),
          News(title: "recent", date: _timestamp(friday.add(_oneDay))),
        ],
      );

      final result = GrpcCacheInterceptor.applyTimeWindow(
        reply,
        ListNewsRequest(oldestDateAt: _timestamp(friday)),
      );

      expect(result.news.map((news) => news.title), ["recent"]);
    });

    test("keeps everything for requests without a time window", () {
      final reply = ListNewsReply(
        news: [News(title: "old", date: _timestamp(monday))],
      );

      final result = GrpcCacheInterceptor.applyTimeWindow(
        reply,
        ListNewsRequest(),
      );

      expect(result.news, hasLength(1));
    });
  });
}

const _oneDay = Duration(days: 1);
