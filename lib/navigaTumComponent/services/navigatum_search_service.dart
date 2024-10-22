import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/navigaTumComponent/model/search/navigatum_search_response.dart';
import 'package:campus_flutter/main.dart';

class NavigaTumSearchService {
  static Future<(DateTime?, NavigaTumSearchResponse)> fetchNavigaTumEntities(
    String query,
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response =
        await restClient.get<NavigaTumSearchResponse, NavigaTumApi>(
      NavigaTumApi(
        navigaTumApiEndpoint: NavigaTumApiEndpointSearch(query: query),
      ),
      NavigaTumSearchResponse.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data);
  }
}
