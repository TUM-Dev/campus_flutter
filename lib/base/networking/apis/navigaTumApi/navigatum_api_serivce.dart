sealed class NavigaTumApiService {
  Map<String, String> getParameters() => {};
}

class NavigaTumApiServiceSearch extends NavigaTumApiService {
  final String query;

  NavigaTumApiServiceSearch({required this.query});

  @override
  Map<String, String> getParameters() => {"q": query};
}

class NavigaTumApiServiceDetails extends NavigaTumApiService {
  final String id;
  final String language;

  NavigaTumApiServiceDetails({required this.id, required this.language});

  @override
  Map<String, String> getParameters() => {"lang": language};
}

class NavigaTumApiServiceImages extends NavigaTumApiService {
  final String id;

  NavigaTumApiServiceImages({required this.id});
}

class NavigaTumApiServiceOverlayImages extends NavigaTumApiService {
  final String id;

  NavigaTumApiServiceOverlayImages({required this.id});
}
