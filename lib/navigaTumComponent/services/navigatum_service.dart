import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_details.dart';
import 'package:campus_flutter/navigaTumComponent/model/search/navigatum_search_response.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter/material.dart';

class NavigaTumService {
  static Future<NavigaTumSearchResponse> search(
    bool forcedRefresh,
    String query,
  ) async {
    RestClient restClient = getIt();
    final response =
        await restClient.get<NavigaTumSearchResponse, NavigaTumApi>(
      NavigaTumApi(
        navigaTumApiEndpoint: NavigaTumApiEndpointSearch(query: query),
      ),
      NavigaTumSearchResponse.fromJson,
      forcedRefresh,
    );

    return response.data;
  }

  static Future<NavigaTumNavigationDetails> details(
    bool forcedRefresh,
    String id,
    BuildContext context,
  ) async {
    final response =
        await getIt<RestClient>().get<NavigaTumNavigationDetails, NavigaTumApi>(
      NavigaTumApi(
        navigaTumApiEndpoint: NavigaTumApiEndpointDetails(
          id: id,
          language: Localizations.localeOf(context).languageCode,
        ),
      ),
      NavigaTumNavigationDetails.fromJson,
      forcedRefresh,
    );

    return response.data;
  }
}
