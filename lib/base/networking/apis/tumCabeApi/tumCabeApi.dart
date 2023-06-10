import 'dart:io';

import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiService.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class TumCabeApi extends Api {

  final TumCabeService tumCabeService;

  TumCabeApi({required this.tumCabeService});

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
  bool get needsAuth => false;

  @override
  String get paths {
    switch (tumCabeService) {
      case TumCabeServiceMovie _:
        return "kino";
      case TumCabeServiceCafeteria _:
        return "mensen";
      case TumCabeServiceNews news:
        return "news/${news.source}/getAll";
      case TumCabeServiceNewsSources _:
        return "news/sources";
      case TumCabeServiceNewsAlert _:
        return "news/alert";
      case TumCabeServiceRoomSearch roomSearch:
        // TODO:
        return "";
        /*return "roomfinder/room/search/${roomSearch.query.addingPercentEncoding(
            withAllowedCharacters: .afURLQueryAllowed) ?? ""}";*/
      case TumCabeServiceRoomMaps roomMaps:
        // TODO:
        return "";
        /*return "roomfinder/room/availableMaps/${roomMaps.room.addingPercentEncoding(
            withAllowedCharacters: .afURLQueryAllowed) ?? ""}";*/
      case TumCabeServiceRoomCoordinates roomCoordinates:
        return "roomfinder/room/coordinates/${roomCoordinates.room}";
      case TumCabeServiceDefaultMap defaultMap:
        return "roomfinder/room/defaultMap/${defaultMap.room}";
      case TumCabeServiceMapImage mapImage:
        return "roomfinder/room/map/${mapImage.room}/${mapImage.id}";
      case TumCabeServiceRegisterDevice registerDevice:
        return "device/register/${registerDevice.publicKey}";
      case TumCabeServiceEvents _:
        return "event/list";
      case TumCabeServiceMyEvents _:
        return "event/ticket/my";
      case TumCabeServiceTicketTypes ticketTypes:
        return "event/ticket/type/${ticketTypes.event}";
      case TumCabeServiceTicketStats ticketStats:
        return "event/ticket/type/${ticketStats.event}";
      case TumCabeServiceTicketReservation _:
        return "event/ticket/reserve";
      case TumCabeServiceTicketReservationCancellation _:
        return "event/ticket/reserve/cancel";
      case TumCabeServiceTicketPurchase _:
        return "event/ticket/payment/stripe/purchase";
      case TumCabeServiceStripeKey _:
        return "event/ticket/payment/stripe/ephemeralkey";
    }
  }

  @override
  Map<String, String> get parameters => {};
}