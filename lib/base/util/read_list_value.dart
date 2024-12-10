List<dynamic> readListValue(Map<dynamic, dynamic> data, String key) {
  final relevantData = data[key];
  if (relevantData is List<dynamic>) {
    return relevantData;
  } else if (relevantData is Map<String, dynamic> || relevantData is String) {
    return [relevantData];
  } else {
    return [];
  }
}
