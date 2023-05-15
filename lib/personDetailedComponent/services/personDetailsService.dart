import 'package:campus_flutter/base/networking/apis/tumOnlineAPI.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';

import '../model/personDetails.dart';

class PersonDetailsService {
  static Future<PersonDetails> fetchPersonDetails(String identNumber) async {
    final response = await MainAPI.makeRequest<PersonDetailsData, TUMOnlineAPI>(
        TUMOnlineAPI(TUMOnlineServices.personDetails, {TUMOnlineParameters.identNumber: identNumber}),
        PersonDetailsData.fromJson,
        TUMOnlineAPI.token,
        false
    );
    return response.person;
  }
}