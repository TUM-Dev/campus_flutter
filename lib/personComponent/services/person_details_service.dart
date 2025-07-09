import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';

class PersonDetailsService {
  static Future<(DateTime?, PersonDetails)> fetchPersonDetails(
    bool forcedRefresh,
    String identNumber,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient
        .getWithException<
          PersonDetailsData,
          TumOnlineApi,
          TumOnlineApiException
        >(
          TumOnlineApi(
            TumOnlineEndpointPersonDetails(identNumber: identNumber),
          ),
          PersonDetailsData.fromJson,
          TumOnlineApiException.fromJson,
          forcedRefresh,
        );
    return (response.saved, response.data.person);
  }
}
