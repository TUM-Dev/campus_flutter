sealed class TumDevAppService {
  Map<String, String> getParameters() => {};
}

class TumDevAppServiceRoom extends TumDevAppService {
  final int roomNr;

  TumDevAppServiceRoom({required this.roomNr});

  @override
  Map<String, String> getParameters() =>
      {"format": "json", "raum": roomNr.toString()};
}

class TumDevAppServiceRooms extends TumDevAppService {
  @override
  Map<String, String> getParameters() => {"format": "json"};
}
