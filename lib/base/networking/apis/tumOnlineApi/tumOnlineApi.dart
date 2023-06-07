import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tumOnlineApiService.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:dio/src/response.dart';

class TUMOnlineApi extends Api {

  static String? token;

  final TUMOnlineService tumOnlineService;

  @override
  final path = "/tumonline/";

  TUMOnlineApi(this.tumOnlineService);

  @override
  String get baseURL => "campus.tum.de";

  @override
  Map<String, String> get baseHeaders => {};

  @override
  // TODO: implement error
  ApiError get error => throw UnimplementedError();

  @override
  String get paths {
    switch (tumOnlineService) {
    case TUMOnlineServicePersonSearch _:
      return "${path}wbservicesbasic.personenSuche";
    case TUMOnlineServiceTokenRequest _:
      return "${path}wbservicesbasic.requestToken";
    case TUMOnlineServiceTokenConfirmation _:
      return "${path}wbservicesbasic.isTokenConfirmed";
    case TUMOnlineServiceTuitionStatus _:
      return "${path}wbservicesbasic.studienbeitragsstatus";
    case TUMOnlineServiceCalendar _:
      return "${path}wbservicesbasic.kalender";
    case TUMOnlineServicePersonDetails _:
      return "${path}wbservicesbasic.personenDetails";
    case TUMOnlineServicePersonalLectures _:
      return "${path}wbservicesbasic.veranstaltungenEigene";
    case TUMOnlineServicePersonalGrades _:
      return "${path}wbservicesbasic.noten";
    case TUMOnlineServiceLectureSearch _:
      return "${path}wbservicesbasic.veranstaltungenSuche";
    case TUMOnlineServiceLectureDetails _:
      return "${path}wbservicesbasic.veranstaltungenDetails";
    case TUMOnlineServiceIdentify _:
      return "${path}wbservicesbasic.id";
    case TUMOnlineServiceSecretUpload _:
      return "${path}wbservicesbasic.secretUpload";
    case TUMOnlineServiceProfileImage _:
      return "${path}visitenkarte.showImage";
    }
  }

  @override
  Map<String, String> get parameters => tumOnlineService.getParameters();

  @override
  bool get needsAuth {
    switch (tumOnlineService) {
      case TUMOnlineServicePersonSearch _:
      case TUMOnlineServiceTokenConfirmation _:
      case TUMOnlineServiceTuitionStatus _:
      case TUMOnlineServiceCalendar _:
      case TUMOnlineServicePersonDetails _:
      case TUMOnlineServicePersonalLectures _:
      case TUMOnlineServicePersonalGrades _:
      case TUMOnlineServiceLectureSearch _:
      case TUMOnlineServiceLectureDetails _:
      case TUMOnlineServiceIdentify _:
        return true;
      default:
        return false;
    }
  }
}