sealed class NavigaTumService {
  Map<String, String> getParameters() => {};
}

class NavigaTumServiceSearch extends NavigaTumService {
  final String query;

  NavigaTumServiceSearch({required this.query});

  @override
  Map<String, String> getParameters() => {
    "q": query
  };
}

class NavigaTumServiceDetails extends NavigaTumService {
  final String id;
  final String language;

  NavigaTumServiceDetails({required this.id, required this.language});

  @override
  Map<String, String> getParameters() => {
    "lang": language
  };
}

class NavigaTumServiceImages extends NavigaTumService {
  final String id;

  NavigaTumServiceImages({required this.id});
}

class NavigaTumServiceOverlayImages extends NavigaTumService {
  final String id;

  NavigaTumServiceOverlayImages({required this.id});
}