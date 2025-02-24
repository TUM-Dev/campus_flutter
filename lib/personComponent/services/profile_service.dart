import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/personComponent/model/profile/profile.dart';
import 'package:campus_flutter/personComponent/model/profile/tuition.dart';

class ProfileService {
  static Future<(DateTime?, Profile)> fetchProfile(bool forcedRefresh) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<Profiles, TumOnlineApi, TumOnlineApiException>(
          TumOnlineApi(TumOnlineEndpointIdentify()),
          Profiles.fromJson,
          TumOnlineApiException.fromJson,
          forcedRefresh,
        );

    return (response.saved, response.data.profile);
  }

  static Future<(DateTime?, Tuition?)> fetchTuition(
    bool forcedRefresh,
    String personGroup,
    String id,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<Tuitions, TumOnlineApi, TumOnlineApiException>(
          TumOnlineApi(TumOnlineEndpointTuitionStatus()),
          Tuitions.fromJson,
          TumOnlineApiException.fromJson,
          forcedRefresh,
        );

    return (response.saved, response.data.tuition);
  }
}
