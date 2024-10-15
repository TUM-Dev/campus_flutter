import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:intl/intl.dart';

class TumOnlineApi extends Api {
  final TumOnlineEndpoint tumOnlineEndpoint;

  TumOnlineApi(this.tumOnlineEndpoint);

  @override
  final path = "tumonline/";

  @override
  String get domain => "campus.tum.de";

  @override
  String get slug {
    switch (tumOnlineEndpoint) {
      case TumOnlineEndpointPersonSearch _:
        return "wbservicesbasic.personenSuche";
      case TumOnlineEndpointTokenRequest _:
        return "wbservicesbasic.requestToken";
      case TumOnlineEndpointTokenConfirmation _:
        return "wbservicesbasic.isTokenConfirmed";
      case TumOnlineEndpointTuitionStatus _:
        return "wbservicesbasic.studienbeitragsstatus";
      case TumOnlineEndpointCalendar _:
        return "wbservicesbasic.kalender";
      case TumOnlineEndpointPersonDetails _:
        return "wbservicesbasic.personenDetails";
      case TumOnlineEndpointPersonalLectures _:
        return "wbservicesbasic.veranstaltungenEigene";
      case TumOnlineEndpointPersonalGrades _:
        return "wbservicesbasic.noten";
      case TumOnlineEndpointLectureSearch _:
        return "wbservicesbasic.veranstaltungenSuche";
      case TumOnlineEndpointLectureDetails _:
        return "wbservicesbasic.veranstaltungenDetails";
      case TumOnlineEndpointIdentify _:
        return "wbservicesbasic.id";
      case TumOnlineEndpointSecretUpload _:
        return "wbservicesbasic.secretUpload";
      case TumOnlineEndpointProfileImage _:
        return "visitenkarte.showImage";
      case TumOnlineEndpointAverageGrades _:
        return "wbservicesbasic.absNoten";
      case TumOnlineEndpointTumCard _:
        return "wbservicesbasic.tumCard";
      case TumOnlineEndpointEventCreate _:
        return "wbservicesbasic.terminCreate";
      case TumOnlineEndpointEventDelete _:
        return "wbservicesbasic.terminDelete";
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
