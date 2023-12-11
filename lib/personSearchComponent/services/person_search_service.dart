import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/rest_client.dart';
import 'package:campus_flutter/personSearchComponent/model/person.dart';
import 'package:campus_flutter/main.dart';

class PersonSearchService {
  static Future<(DateTime?, List<Person>)> fetchPersons(
    String query,
    bool forcedRefresh,
  ) async {
    RESTClient mainApi = getIt<RESTClient>();
    final response = await mainApi.makeRequestWithException<PersonData,
        TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServicePersonSearch(search: query)),
      PersonData.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data.personAttribute?.persons ?? []);
  }
}
