sealed class TUMCabeService {
  Map<String, String> getParameters() => {};
}

class TUMCabeServiceMovie extends TUMCabeService {}

class TUMCabeServiceCafeteria extends TUMCabeService {}

class TUMCabeServiceNews extends TUMCabeService {
  final String source;

  TUMCabeServiceNews({required this.source});
}

class TUMCabeServiceNewsSources extends TUMCabeService {}

class TUMCabeServiceNewsAlert extends TUMCabeService {}

class TUMCabeServiceRoomSearch extends TUMCabeService {
  final String query;

  TUMCabeServiceRoomSearch({required this.query});
}

class TUMCabeServiceRoomMaps extends TUMCabeService {
  final String room;

  TUMCabeServiceRoomMaps({required this.room});
}

class TUMCabeServiceRoomCoordinates extends TUMCabeService {
  final String room;

  TUMCabeServiceRoomCoordinates({required this.room});
}

class TUMCabeServiceMapImage extends TUMCabeService {
  final int id;
  final String room;

  TUMCabeServiceMapImage({required this.id, required this.room});
}

class TUMCabeServiceDefaultMap extends TUMCabeService {
  final String room;

  TUMCabeServiceDefaultMap({required this.room});
}

class TUMCabeServiceRegisterDevice extends TUMCabeService {
  final String publicKey;

  TUMCabeServiceRegisterDevice({required this.publicKey});
}

class TUMCabeServiceEvents extends TUMCabeService {}

class TUMCabeServiceMyEvents extends TUMCabeService {}

class TUMCabeServiceTicketTypes extends TUMCabeService {
  final int event;

  TUMCabeServiceTicketTypes({required this.event});
}

class TUMCabeServiceTicketStats extends TUMCabeService {
  final int event;

  TUMCabeServiceTicketStats({required this.event});
}

class TUMCabeServiceTicketReservation extends TUMCabeService {}

class TUMCabeServiceTicketReservationCancellation extends TUMCabeService {}

class TUMCabeServiceTicketPurchase extends TUMCabeService {}

class TUMCabeServiceStripeKey extends TUMCabeService {}