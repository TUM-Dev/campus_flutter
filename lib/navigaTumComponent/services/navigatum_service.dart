import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_serivce.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_details.dart';
import 'package:campus_flutter/navigaTumComponent/model/search/navigatum_search_response.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigaTumService {
  static Future<NavigaTumSearchResponse> search(
    bool forcedRefresh,
    String query,
  ) async {
    RESTClient restClient = getIt();
    final response =
        await restClient.get<NavigaTumSearchResponse, NavigaTumApi>(
      NavigaTumApi(
        navigaTumApiService: NavigaTumApiServiceSearch(query: query),
      ),
      NavigaTumSearchResponse.fromJson,
      forcedRefresh,
    );

    return response.data;
  }

  static Future<NavigaTumNavigationDetails> details(
    bool forcedRefresh,
    String id,
    Ref ref,
  ) async {
    final response = await getIt<RESTClient>()
        .get<NavigaTumNavigationDetails, NavigaTumApi>(
      NavigaTumApi(
        navigaTumApiService: NavigaTumApiServiceDetails(
          id: id,
          language: ref.read(locale).languageCode,
        ),
      ),
      NavigaTumNavigationDetails.fromJson,
      forcedRefresh,
    );

    return response.data;
  }
}
