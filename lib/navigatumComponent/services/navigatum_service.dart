import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_serivce.dart';
import 'package:campus_flutter/base/networking/protocols/main_api.dart';
import 'package:campus_flutter/navigatumComponent/model/navigatum_navigation_details.dart';
import 'package:campus_flutter/navigatumComponent/model/search/navigatum_search_response.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigaTumService {
  static Future<NavigaTumSearchResponse> search(
      bool forcedRefresh, String query) async {
    MainApi mainApi = getIt();
    final response =
        await mainApi.makeRequest<NavigaTumSearchResponse, NavigaTumApi>(
            NavigaTumApi(
                navigaTumApiService: NavigaTumApiServiceSearch(query: query)),
            NavigaTumSearchResponse.fromJson,
            forcedRefresh);

    return response.data;
  }

  static Future<NavigaTumNavigationDetails> details(
      bool forcedRefresh, String id, Ref ref) async {
    final response = await getIt<MainApi>()
        .makeRequest<NavigaTumNavigationDetails, NavigaTumApi>(
            NavigaTumApi(
                navigaTumApiService: NavigaTumApiServiceDetails(
                    id: id, language: ref.read(locale).languageCode)),
            NavigaTumNavigationDetails.fromJson,
            forcedRefresh);

    return response.data;
  }

/*static Future<NavigaTumNavigationDetails> fetch(
      bool forcedRefresh, String query) async {
    final response = await getIt<MainApi>()
        .makeRequest<NavigaTumNavigationDetails, NavigaTumApi>(
            NavigaTumApi(navigaTumApiService: Na(id: query, language: "en")),
            (p0) => null,
            forcedRefresh);

    return response.data;
  }

  func fetch(for query: String, forcedRefresh: Bool) async throws -> [FoundRoom] {
  let response : [FoundRoom] = try await MainAPI.makeRequest(endpoint: TUMCabeAPI.roomApiSearch(query: query))

  return response
  }*/
}
