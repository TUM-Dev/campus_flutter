
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiService.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

class TumCabeApi extends Api {

  final TumCabeService tumCabeService;

  TumCabeApi({required this.tumCabeService});

  @override
  String get baseURL => "app.tum.de";

  @override
  Map<String, String> get baseHeaders {
    return {
      "x-app-version": "0.1.0",
      "x-app-build": "11",
      "x-device-id": "not available",
      "x-os-version": "16.4.1"
    };

    // TODO:

    /*Map<String, String> headerEntries = {};

    PackageInfo.fromPlatform().then((value) { headerEntries
        .addAll({
          "x-app-version": [value.version],
          "x-app-build": [value.buildNumber],
        });

    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      deviceInfo.iosInfo.then((value) => headerEntries
          .addAll({
            "x-device-id": [value.identifierForVendor ?? "not available"],
            "x-os-version": [value.systemVersion]
          }));
    } else if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((value) => headerEntries
          .addAll({"x-device-id": [value.id], "x-os-version": [value.version.toString()]}));
    }});

    return headerEntries;*/
  }

  @override
  String get path => "/api/";

  @override
  bool get needsAuth => false;

  @override
  String get paths {
    switch (tumCabeService) {
      case TumCabeServiceMovie _:
        return "${path}kino";
      case TumCabeServiceCafeteria _:
        return "${path}mensen";
      case TumCabeServiceNews news:
        return "${path}news/${news.source}/getAll";
      case TumCabeServiceNewsSources _:
        return "${path}news/sources";
      case TumCabeServiceNewsAlert _:
        return "${path}news/alert";
      case TumCabeServiceRoomSearch roomSearch:
        // TODO:
        return path;
        /*return "roomfinder/room/search/${roomSearch.query.addingPercentEncoding(
            withAllowedCharacters: .afURLQueryAllowed) ?? ""}";*/
      case TumCabeServiceRoomMaps roomMaps:
        // TODO:
        return path;
        /*return "roomfinder/room/availableMaps/${roomMaps.room.addingPercentEncoding(
            withAllowedCharacters: .afURLQueryAllowed) ?? ""}";*/
      case TumCabeServiceRoomCoordinates roomCoordinates:
        return "${path}roomfinder/room/coordinates/${roomCoordinates.room}";
      case TumCabeServiceDefaultMap defaultMap:
        return "${path}roomfinder/room/defaultMap/${defaultMap.room}";
      case TumCabeServiceMapImage mapImage:
        return "${path}roomfinder/room/map/${mapImage.room}/${mapImage.id}";
      case TumCabeServiceRegisterDevice registerDevice:
        return "${path}device/register/${registerDevice.publicKey}";
      case TumCabeServiceEvents _:
        return "${path}event/list";
      case TumCabeServiceMyEvents _:
        return "${path}event/ticket/my";
      case TumCabeServiceTicketTypes ticketTypes:
        return "${path}event/ticket/type/${ticketTypes.event}";
      case TumCabeServiceTicketStats ticketStats:
        return "${path}event/ticket/type/${ticketStats.event}";
      case TumCabeServiceTicketReservation _:
        return "${path}event/ticket/reserve";
      case TumCabeServiceTicketReservationCancellation _:
        return "${path}event/ticket/reserve/cancel";
      case TumCabeServiceTicketPurchase _:
        return "${path}event/ticket/payment/stripe/purchase";
      case TumCabeServiceStripeKey _:
        return "${path}event/ticket/payment/stripe/ephemeralkey";
    }
  }

  @override
  Map<String, String> get parameters => {};
}