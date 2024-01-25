import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/personSearchComponent/model/person.dart';
import 'package:campus_flutter/main.dart';

class PersonSearchService {
  static Future<(DateTime?, List<Person>)> fetchPersons(
    String query,
    bool forcedRefresh,
  ) async {
    RESTClient restClient = getIt<RESTClient>();
    final response = await restClient
        .getWithException<Persons, TumOnlineApi, TumOnlineApiException>(
      TumOnlineApi(TumOnlineServicePersonSearch(search: query)),
      Persons.fromJson,
      TumOnlineApiException.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data.persons);
  }
}
