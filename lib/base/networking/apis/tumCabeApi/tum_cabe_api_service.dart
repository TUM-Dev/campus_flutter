sealed class TumCabeService {
  Map<String, String> getParameters() => {};
}

class TumCabeServiceMovie extends TumCabeService {}

class TumCabeServiceCafeteria extends TumCabeService {}

class TumCabeServiceNews extends TumCabeService {
  final String source;

  TumCabeServiceNews({required this.source});
}

class TumCabeServiceNewsSources extends TumCabeService {}

class TumCabeServiceNewsAlert extends TumCabeService {}

class TumCabeServiceRoomSearch extends TumCabeService {
  final String query;

  TumCabeServiceRoomSearch({required this.query});
}

class TumCabeServiceRoomMaps extends TumCabeService {
  final String room;

  TumCabeServiceRoomMaps({required this.room});
}

class TumCabeServiceRoomCoordinates extends TumCabeService {
  final String room;

  TumCabeServiceRoomCoordinates({required this.room});
}

class TumCabeServiceMapImage extends TumCabeService {
  final int id;
  final String room;

  TumCabeServiceMapImage({required this.id, required this.room});
}

class TumCabeServiceDefaultMap extends TumCabeService {
  final String room;

  TumCabeServiceDefaultMap({required this.room});
}

class TumCabeServiceRegisterDevice extends TumCabeService {
  final String publicKey;

  TumCabeServiceRegisterDevice({required this.publicKey});
}

class TumCabeServiceEvents extends TumCabeService {}

class TumCabeServiceMyEvents extends TumCabeService {}

class TumCabeServiceTicketTypes extends TumCabeService {
  final int event;

  TumCabeServiceTicketTypes({required this.event});
}

class TumCabeServiceTicketStats extends TumCabeService {
  final int event;

  TumCabeServiceTicketStats({required this.event});
}

class TumCabeServiceTicketReservation extends TumCabeService {}

class TumCabeServiceTicketReservationCancellation extends TumCabeService {}

class TumCabeServiceTicketPurchase extends TumCabeService {}

class TumCabeServiceStripeKey extends TumCabeService {}