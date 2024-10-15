import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:intl/intl.dart';

class TumOnlineApi extends Api {
  final TumOnlineEndpoint tumOnlineEndpoint;

  TumOnlineApi(this.tumOnlineEndpoint);

  @override
  final path = "/tumonline/";

  @override
  String get baseURL => "campus.tum.de";

  @override
  String get paths {
    switch (tumOnlineEndpoint) {
      case TumOnlineEndpointPersonSearch _:
        return "${path}wbservicesbasic.personenSuche";
      case TumOnlineEndpointTokenRequest _:
        return "${path}wbservicesbasic.requestToken";
      case TumOnlineEndpointTokenConfirmation _:
        return "${path}wbservicesbasic.isTokenConfirmed";
      case TumOnlineEndpointTuitionStatus _:
        return "${path}wbservicesbasic.studienbeitragsstatus";
      case TumOnlineEndpointCalendar _:
        return "${path}wbservicesbasic.kalender";
      case TumOnlineEndpointPersonDetails _:
        return "${path}wbservicesbasic.personenDetails";
      case TumOnlineEndpointPersonalLectures _:
        return "${path}wbservicesbasic.veranstaltungenEigene";
      case TumOnlineEndpointPersonalGrades _:
        return "${path}wbservicesbasic.noten";
      case TumOnlineEndpointLectureSearch _:
        return "${path}wbservicesbasic.veranstaltungenSuche";
      case TumOnlineEndpointLectureDetails _:
        return "${path}wbservicesbasic.veranstaltungenDetails";
      case TumOnlineEndpointIdentify _:
        return "${path}wbservicesbasic.id";
      case TumOnlineEndpointSecretUpload _:
        return "${path}wbservicesbasic.secretUpload";
      case TumOnlineEndpointProfileImage _:
        return "${path}visitenkarte.showImage";
      case TumOnlineEndpointAverageGrades _:
        return "${path}wbservicesbasic.absNoten";
      case TumOnlineEndpointTumCard _:
        return "${path}wbservicesbasic.tumCard";
      case TumOnlineEndpointEventCreate _:
        return "${path}wbservicesbasic.terminCreate";
      case TumOnlineEndpointEventDelete _:
        return "${path}wbservicesbasic.terminDelete";
    }
  }

  @override
  Map<String, String> get parameters => tumOnlineEndpoint.getParameters();

  @override
  bool get needsAuth {
    switch (tumOnlineEndpoint) {
      case TumOnlineEndpointPersonSearch _:
      case TumOnlineEndpointTokenConfirmation _:
      case TumOnlineEndpointTuitionStatus _:
      case TumOnlineEndpointCalendar _:
      case TumOnlineEndpointPersonDetails _:
      case TumOnlineEndpointPersonalLectures _:
      case TumOnlineEndpointPersonalGrades _:
      case TumOnlineEndpointLectureSearch _:
      case TumOnlineEndpointLectureDetails _:
      case TumOnlineEndpointIdentify _:
      case TumOnlineEndpointTumCard _:
      case TumOnlineEndpointAverageGrades _:
      case TumOnlineEndpointEventCreate _:
      case TumOnlineEndpointEventDelete _:
        return true;
      default:
        return false;
    }
  }

  static final dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
}
