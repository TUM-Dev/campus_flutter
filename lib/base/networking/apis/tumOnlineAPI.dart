import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class TUMOnlineAPI extends API {

  static String? token;

  final Map<TUMOnlineParameters, String> passedParameters;

  final TUMOnlineServices tumOnlineServices;

  @override
  final path = "/tumonline/";

  TUMOnlineAPI(this.tumOnlineServices, this.passedParameters);

  @override
  String get baseURL => "campus.tum.de";

  @override
  List<String> get baseHeaders => [];

  @override
  // TODO: implement error
  APIError get error => throw UnimplementedError();

  @override
  String get paths {
    switch (tumOnlineServices) {
    case TUMOnlineServices.personSearch:
      return "${path}wbservicesbasic.personenSuche";
    case TUMOnlineServices.tokenRequest:
      return "${path}wbservicesbasic.requestToken";
    case TUMOnlineServices.tokenConfirmation:
      return "${path}wbservicesbasic.isTokenConfirmed";
    case TUMOnlineServices.tuitionStatus:
      return "${path}wbservicesbasic.studienbeitragsstatus";
    case TUMOnlineServices.calendar:
      return "${path}wbservicesbasic.kalender";
    case TUMOnlineServices.personDetails:
      return "${path}wbservicesbasic.personenDetails";
    case TUMOnlineServices.personalLectures:
      return "${path}wbservicesbasic.veranstaltungenEigene";
    case TUMOnlineServices.personalGrades:
      return "${path}wbservicesbasic.noten";
    case TUMOnlineServices.lectureSearch:
      return "${path}wbservicesbasic.veranstaltungenSuche";
    case TUMOnlineServices.lectureDetails:
      return "${path}wbservicesbasic.veranstaltungenDetails";
    case TUMOnlineServices.identify:
      return "${path}wbservicesbasic.id";
    case TUMOnlineServices.secretUpload:
      return "${path}wbservicesbasic.secretUpload";
    case TUMOnlineServices.profileImage:
      return "${path}visitenkarte.showImage";
    }
  }

  @override
  Map<String, String> get parameters {
    switch (tumOnlineServices) {
      case TUMOnlineServices.personSearch:
        return {TUMOnlineParameters.search.parameterName: passedParameters[TUMOnlineParameters.search] ?? ""};
      case TUMOnlineServices.tokenRequest:
        return {
          TUMOnlineParameters.tumID.parameterName: passedParameters[TUMOnlineParameters.tumID] ?? "",
          TUMOnlineParameters.tokenName.parameterName: "TCA - ${passedParameters[TUMOnlineParameters.tokenName] ?? ""}",
        };
      case TUMOnlineServices.personDetails:
        return {TUMOnlineParameters.identNumber.parameterName: passedParameters[TUMOnlineParameters.identNumber] ?? ""};
      case TUMOnlineServices.lectureSearch:
        return {TUMOnlineParameters.search.parameterName: passedParameters[TUMOnlineParameters.search] ?? ""};
      case TUMOnlineServices.lectureDetails:
        return {TUMOnlineParameters.lvNr.parameterName: passedParameters[TUMOnlineParameters.lvNr] ?? ""};
      case TUMOnlineServices.profileImage:
        return {
          TUMOnlineParameters.personGroup.parameterName: passedParameters[TUMOnlineParameters.personGroup] ?? "",
          TUMOnlineParameters.id.parameterName: passedParameters[TUMOnlineParameters.id] ?? "",
        };
      default:
        return {};
    }
  }

  @override
  bool get needsAuth {
    switch (tumOnlineServices) {
      case TUMOnlineServices.personSearch:
      case TUMOnlineServices.tokenConfirmation:
      case TUMOnlineServices.tuitionStatus:
      case TUMOnlineServices.calendar:
      case TUMOnlineServices.personDetails:
      case TUMOnlineServices.personalLectures:
      case TUMOnlineServices.personalGrades:
      case TUMOnlineServices.lectureSearch:
      case TUMOnlineServices.lectureDetails:
      case TUMOnlineServices.identify:
        return true;
      default:
        return false;
    }
  }

  // TODO: dateDecodingStrategy

  /*@override
  T decode<T extends JsonSerializable>(Map<String, dynamic> data) {
    deserialize(json, (data) => T.fromJSON)
  }

  T deserialize<T extends JsonSerializable>(
      String json,
      T Function(Map<String, dynamic> data) factory,
      ) {
    return factory(jsonDecode(json) as Map<String, dynamic>);
  }*/
}

enum TUMOnlineServices {
  personSearch,
  tokenRequest,
  tokenConfirmation,
  tuitionStatus,
  calendar,
  personDetails,
  personalLectures,
  personalGrades,
  lectureSearch,
  lectureDetails,
  identify,
  secretUpload,
  profileImage
}

enum TUMOnlineParameters {
  search("pSuche"),
  tumID("pUsername"),
  tokenName("pTokenName"),
  identNumber("pIdentNr"),
  lvNr("pLVNr"),
  personGroup("pPersonenGruppe"),
  id("pPersonenId");

  const TUMOnlineParameters(this.parameterName);

  final String parameterName;
}