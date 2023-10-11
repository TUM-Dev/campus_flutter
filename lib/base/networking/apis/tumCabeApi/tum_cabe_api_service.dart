sealed class TumCabeApiService {
  Map<String, String> getParameters() => {};
}

class TumCabeApiServiceMovie extends TumCabeApiService {
  final DateTime? today;

  TumCabeApiServiceMovie(this.today);

  @override
  Map<String, String> getParameters() {
    if (today != null) {
      return {"oldestDateAt": today!.toUtc().toIso8601String()};
    } else {
      return {};
    }
  }
}

class TumCabeApiServiceCafeteria extends TumCabeApiService {}

class TumCabeApiServiceNews extends TumCabeApiService {
  final DateTime? dateOldestNews;

  TumCabeApiServiceNews(this.dateOldestNews);

  @override
  Map<String, String> getParameters() {
    if (dateOldestNews != null) {
      return {"oldestDateAt": dateOldestNews!.toUtc().toIso8601String()};
    } else {
      return {};
    }
  }
}

class TumCabeApiServiceNewsSources extends TumCabeApiService {}

class TumCabeApiServiceNewsAlert extends TumCabeApiService {}

class TumCabeApiServiceFeedback extends TumCabeApiService {
  final String topic;
  final String email;
  final String emailId;
  final String message;
  final int imageCount;
  final double latitude;
  final double longitude;
  final String osVersion;
  final String appVersion;

  TumCabeApiServiceFeedback(
      {required this.topic,
      required this.email,
      required this.emailId,
      required this.message,
      required this.imageCount,
      required this.latitude,
      required this.longitude,
      required this.osVersion,
      required this.appVersion});

  @override
  Map<String, String> getParameters() => {
        "topic": topic,
        "email": email,
        "emailId": emailId,
        "message": message,
        "imageCount": imageCount.toString(),
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
        "osVersion": osVersion,
        "appVersion": appVersion
      };
}
