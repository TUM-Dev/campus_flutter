import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_serivce.dart';
import 'package:campus_flutter/base/networking/protocols/rest_client.dart';
import 'package:campus_flutter/navigaTumComponent/model/search/navigatum_search_response.dart';
import 'package:campus_flutter/main.dart';

class NavigaTumSearchService {
  static Future<(DateTime?, NavigaTumSearchResponse)> fetchNavigaTumEntities(
    String query,
    bool forcedRefresh,
  ) async {
    RESTClient mainApi = getIt<RESTClient>();
    final response =
        await mainApi.makeRequest<NavigaTumSearchResponse, NavigaTumApi>(
      NavigaTumApi(
        navigaTumApiService: NavigaTumApiServiceSearch(query: query),
      ),
      NavigaTumSearchResponse.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data);
  }
}
