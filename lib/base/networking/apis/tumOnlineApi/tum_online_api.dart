import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_service.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:intl/intl.dart';

class TumOnlineApi extends Api {
  final TumOnlineService tumOnlineService;

  TumOnlineApi(this.tumOnlineService);

  @override
  final path = "/tumonline/";

  @override
  String get baseURL => "campus.tum.de";

  @override
  String get paths {
    switch (tumOnlineService) {
      case TumOnlineServicePersonSearch _:
        return "${path}wbservicesbasic.personenSuche";
      case TumOnlineServiceTokenRequest _:
        return "${path}wbservicesbasic.requestToken";
      case TumOnlineServiceTokenConfirmation _:
        return "${path}wbservicesbasic.isTokenConfirmed";
      case TumOnlineServiceTuitionStatus _:
        return "${path}wbservicesbasic.studienbeitragsstatus";
      case TumOnlineServiceCalendar _:
        return "${path}wbservicesbasic.kalender";
      case TumOnlineServicePersonDetails _:
        return "${path}wbservicesbasic.personenDetails";
      case TumOnlineServicePersonalLectures _:
        return "${path}wbservicesbasic.veranstaltungenEigene";
      case TumOnlineServicePersonalGrades _:
        return "${path}wbservicesbasic.noten";
      case TumOnlineServiceLectureSearch _:
        return "${path}wbservicesbasic.veranstaltungenSuche";
      case TumOnlineServiceLectureDetails _:
        return "${path}wbservicesbasic.veranstaltungenDetails";
      case TumOnlineServiceIdentify _:
        return "${path}wbservicesbasic.id";
      case TumOnlineServiceSecretUpload _:
        return "${path}wbservicesbasic.secretUpload";
      case TumOnlineServiceProfileImage _:
        return "${path}visitenkarte.showImage";
      case TumOnlineServiceAverageGrades _:
        return "${path}wbservicesbasic.absNoten";
      case TumOnlineServiceTumCard _:
        return "${path}wbservicesbasic.tumCard";
      case TumOnlineServiceEventCreate _:
        return "${path}wbservicesbasic.terminCreate";
      case TumOnlineServiceEventDelete _:
        return "${path}wbservicesbasic.terminDelete";
    }
  }

  @override
  Map<String, String> get parameters => tumOnlineService.getParameters();

  @override
  bool get needsAuth {
    switch (tumOnlineService) {
      case TumOnlineServicePersonSearch _:
      case TumOnlineServiceTokenConfirmation _:
      case TumOnlineServiceTuitionStatus _:
      case TumOnlineServiceCalendar _:
      case TumOnlineServicePersonDetails _:
      case TumOnlineServicePersonalLectures _:
      case TumOnlineServicePersonalGrades _:
      case TumOnlineServiceLectureSearch _:
      case TumOnlineServiceLectureDetails _:
      case TumOnlineServiceIdentify _:
      case TumOnlineServiceTumCard _:
      case TumOnlineServiceAverageGrades _:
      case TumOnlineServiceEventCreate _:
      case TumOnlineServiceEventDelete _:
        return true;
      default:
        return false;
    }
  }

  static final dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
}
