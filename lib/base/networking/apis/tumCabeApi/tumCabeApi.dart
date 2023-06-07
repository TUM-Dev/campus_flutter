import 'dart:io';

import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiService.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class TUMCabeApi extends Api {

  final TUMCabeService tumCabeService;

  TUMCabeApi({required this.tumCabeService});

  @override
  String get baseURL => "https://app.tum.de/api/";

  @override
  Map<String, String> get baseHeaders {
    Map<String, String> headerEntries = {};
    PackageInfo.fromPlatform().then((value) => headerEntries
        .addAll({
          "X-APP-VERSION": value.version,
          "X-APP-BUILD": value.buildNumber,
        }));

    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      deviceInfo.iosInfo.then((value) => headerEntries
          .addAll({
            "X-DEVICE-ID": value.identifierForVendor ?? "not available",
            "X-OS-VERSION": value.systemVersion
          }));
    } else if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((value) => headerEntries
          .addAll({"X-DEVICE-ID": value.id, "X-OS-VERSION": value.version.toString()}));
    }

    return headerEntries;
  }

  @override
  String get path => "";

  @override
  // TODO: implement error
  ApiError get error => throw UnimplementedError();

  @override
  bool get needsAuth => false;

  @override
  String get paths {
    switch (tumCabeService) {
      case TUMCabeServiceMovie _:
        return "kino";
      case TUMCabeServiceCafeteria _:
        return "mensen";
      case TUMCabeServiceNews news:
        return "news/${news.source}/getAll";
      case TUMCabeServiceNewsSources _:
        return "news/sources";
      case TUMCabeServiceNewsAlert _:
        return "news/alert";
      case TUMCabeServiceRoomSearch roomSearch:
        // TODO:
        return "";
        /*return "roomfinder/room/search/${roomSearch.query.addingPercentEncoding(
            withAllowedCharacters: .afURLQueryAllowed) ?? ""}";*/
      case TUMCabeServiceRoomMaps roomMaps:
        // TODO:
        return "";
        /*return "roomfinder/room/availableMaps/${roomMaps.room.addingPercentEncoding(
            withAllowedCharacters: .afURLQueryAllowed) ?? ""}";*/
      case TUMCabeServiceRoomCoordinates roomCoordinates:
        return "roomfinder/room/coordinates/${roomCoordinates.room}";
      case TUMCabeServiceDefaultMap defaultMap:
        return "roomfinder/room/defaultMap/${defaultMap.room}";
      case TUMCabeServiceMapImage mapImage:
        return "roomfinder/room/map/${mapImage.room}/${mapImage.id}";
      case TUMCabeServiceRegisterDevice registerDevice:
        return "device/register/${registerDevice.publicKey}";
      case TUMCabeServiceEvents _:
        return "event/list";
      case TUMCabeServiceMyEvents _:
        return "event/ticket/my";
      case TUMCabeServiceTicketTypes ticketTypes:
        return "event/ticket/type/${ticketTypes.event}";
      case TUMCabeServiceTicketStats ticketStats:
        return "event/ticket/type/${ticketStats.event}";
      case TUMCabeServiceTicketReservation _:
        return "event/ticket/reserve";
      case TUMCabeServiceTicketReservationCancellation _:
        return "event/ticket/reserve/cancel";
      case TUMCabeServiceTicketPurchase _:
        return "event/ticket/payment/stripe/purchase";
      case TUMCabeServiceStripeKey _:
        return "event/ticket/payment/stripe/ephemeralkey";
    }
  }

  @override
  Map<String, String> get parameters => {};
}