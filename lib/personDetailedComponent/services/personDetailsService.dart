import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApi.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';

import '../model/personDetails.dart';

class PersonDetailsService {
  static Future<PersonDetails> fetchPersonDetails(String identNumber) async {
    final response = await MainApi.makeRequest<PersonDetailsData, TUMOnlineApi>(
        TUMOnlineApi(TUMOnlineServicePersonDetails(identNumber: identNumber)),
        PersonDetailsData.fromJson,
        TUMOnlineApi.token,
        false
    );
    return response.person;
  }
}