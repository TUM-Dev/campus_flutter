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

class TumCabeServiceRegisterDevice extends TumCabeService {
  final String publicKey;

  TumCabeServiceRegisterDevice({required this.publicKey});
}
