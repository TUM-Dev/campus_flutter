import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_endpoint.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:intl/intl.dart';

class TumOnlineApi extends Api {
  final TumOnlineEndpoint tumOnlineEndpoint;

  TumOnlineApi(this.tumOnlineEndpoint);

  @override
  final slug = "/tumonline/";

  @override
  String get domain => "campus.tum.de";

  @override
  String get path {
    switch (tumOnlineEndpoint) {
      case TumOnlineEndpointPersonSearch _:
        return "${slug}wbservicesbasic.personenSuche";
      case TumOnlineEndpointTokenRequest _:
        return "${slug}wbservicesbasic.requestToken";
      case TumOnlineEndpointTokenConfirmation _:
        return "${slug}wbservicesbasic.isTokenConfirmed";
      case TumOnlineEndpointTuitionStatus _:
        return "${slug}wbservicesbasic.studienbeitragsstatus";
      case TumOnlineEndpointCalendar _:
        return "${slug}wbservicesbasic.kalender";
      case TumOnlineEndpointPersonDetails _:
        return "${slug}wbservicesbasic.personenDetails";
      case TumOnlineEndpointPersonalLectures _:
        return "${slug}wbservicesbasic.veranstaltungenEigene";
      case TumOnlineEndpointPersonalGrades _:
        return "${slug}wbservicesbasic.noten";
      case TumOnlineEndpointLectureSearch _:
        return "${slug}wbservicesbasic.veranstaltungenSuche";
      case TumOnlineEndpointLectureDetails _:
        return "${slug}wbservicesbasic.veranstaltungenDetails";
      case TumOnlineEndpointIdentify _:
        return "${slug}wbservicesbasic.id";
      case TumOnlineEndpointSecretUpload _:
        return "${slug}wbservicesbasic.secretUpload";
      case TumOnlineEndpointProfileImage _:
        return "${slug}visitenkarte.showImage";
      case TumOnlineEndpointAverageGrades _:
        return "${slug}wbservicesbasic.absNoten";
      case TumOnlineEndpointTumCard _:
        return "${slug}wbservicesbasic.tumCard";
      case TumOnlineEndpointEventCreate _:
        return "${slug}wbservicesbasic.terminCreate";
      case TumOnlineEndpointEventDelete _:
        return "${slug}wbservicesbasic.terminDelete";
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
