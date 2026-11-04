import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_course_api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';

class LectureDetailsService {
  static Future<(DateTime?, LectureDetails)> fetchLectureDetails(
    String lvNumber,
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    try {
      final response = await restClient
          .getWithException<
            LectureDetailsElement,
            TumOnlineApi,
            TumOnlineApiException
          >(
            TumOnlineApi(TumOnlineEndpointLectureDetails(lvNr: lvNumber)),
            LectureDetailsElement.fromJson,
            TumOnlineApiException.fromJson,
            forcedRefresh,
          );

      return (response.saved, response.data.lectureDetails);
    } on TumOnlineApiException catch (e) {
      if (!shouldUseCourseApiFallback(e)) rethrow;
      return _fetchFromCourseApi(lvNumber, forcedRefresh);
    }
  }

  /// The legacy endpoint answers with an unrecognised error message while
  /// TUMonline has it disabled (e.g. "Veranstaltungsabruf temporär nicht
  /// möglich!"). Token and permission errors are known types and must still
  /// reach the user, so only unknown errors trigger the fallback.
  static bool shouldUseCourseApiFallback(TumOnlineApiException exception) =>
      exception.tumOnlineApiExceptionType is TumOnlineApiExceptionUnknown;

  static Future<(DateTime?, LectureDetails)> _fetchFromCourseApi(
    String lvNumber,
    bool forcedRefresh,
  ) async {
    final response = await getIt<RestClient>()
        .get<LectureDetails, TumOnlineCourseApi>(
          TumOnlineCourseApi(lvNumber),
          LectureDetails.fromCourseJson,
          forcedRefresh,
        );
    return (response.saved, response.data);
  }
}
