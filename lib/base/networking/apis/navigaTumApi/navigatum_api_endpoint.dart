sealed class NavigaTumApiEndpoint {
  Map<String, String> getParameters() => {};
}

class NavigaTumApiEndpointSearch extends NavigaTumApiEndpoint {
  final String query;
  final String? type;

  NavigaTumApiEndpointSearch({required this.query, this.type});

  @override
  Map<String, String> getParameters() => {"q": query, "type": ?type};
}

class NavigaTumApiEndpointDetails extends NavigaTumApiEndpoint {
  final String id;
  final String language;

  NavigaTumApiEndpointDetails({required this.id, required this.language});

  @override
  Map<String, String> getParameters() => {"lang": language};
}

class NavigaTumApiEndpointImages extends NavigaTumApiEndpoint {
  final String id;

  NavigaTumApiEndpointImages({required this.id});
}

class NavigaTumApiEndpointOverlayImages extends NavigaTumApiEndpoint {
  final String id;

  NavigaTumApiEndpointOverlayImages({required this.id});
}
