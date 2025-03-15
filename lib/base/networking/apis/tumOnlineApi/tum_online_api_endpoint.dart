sealed class TumOnlineEndpoint {
  Map<String, String> getParameters() => {};
}

class TumOnlineEndpointTokenRequest extends TumOnlineEndpoint {
  final String tumId;
  final String deviceName;

  TumOnlineEndpointTokenRequest({
    required this.tumId,
    required this.deviceName,
  });

  @override
  Map<String, String> getParameters() => {
    "pUsername": tumId,
    "pTokenName": deviceName,
  };
}

class TumOnlineEndpointTokenConfirmation extends TumOnlineEndpoint {}

class TumOnlineEndpointTuitionStatus extends TumOnlineEndpoint {}

class TumOnlineEndpointCalendar extends TumOnlineEndpoint {}

class TumOnlineEndpointPersonSearch extends TumOnlineEndpoint {
  final String search;

  TumOnlineEndpointPersonSearch({required this.search});

  @override
  Map<String, String> getParameters() => {"pSuche": search};
}

class TumOnlineEndpointPersonDetails extends TumOnlineEndpoint {
  final String identNumber;

  TumOnlineEndpointPersonDetails({required this.identNumber});

  @override
  Map<String, String> getParameters() => {"pIdentNr": identNumber};
}

class TumOnlineEndpointPersonalLectures extends TumOnlineEndpoint {}

class TumOnlineEndpointPersonalGrades extends TumOnlineEndpoint {}

class TumOnlineEndpointAverageGrades extends TumOnlineEndpoint {}

class TumOnlineEndpointLectureSearch extends TumOnlineEndpoint {
  final String search;

  TumOnlineEndpointLectureSearch({required this.search});

  @override
  Map<String, String> getParameters() => {"pSuche": search};
}

class TumOnlineEndpointLectureDetails extends TumOnlineEndpoint {
  final String lvNr;

  TumOnlineEndpointLectureDetails({required this.lvNr});

  @override
  Map<String, String> getParameters() => {"pLVNr": lvNr};
}

class TumOnlineEndpointIdentify extends TumOnlineEndpoint {}

class TumOnlineEndpointSecretUpload extends TumOnlineEndpoint {}

class TumOnlineEndpointTumCard extends TumOnlineEndpoint {}

class TumOnlineEndpointProfileImage extends TumOnlineEndpoint {
  final String personGroup;
  final String id;

  TumOnlineEndpointProfileImage({required this.personGroup, required this.id});

  @override
  Map<String, String> getParameters() => {
    "pPersonenGruppe": personGroup,
    "pPersonenId": id,
  };
}

class TumOnlineEndpointEventCreate extends TumOnlineEndpoint {
  final String title;
  final String? annotation;
  final String from;
  final String to;

  TumOnlineEndpointEventCreate({
    required this.title,
    required this.annotation,
    required this.from,
    required this.to,
  });

  @override
  Map<String, String> getParameters() => {
    "pTitel": title,
    if (annotation != null) "pAnmerkung": annotation!,
    "pVon": from,
    "pBis": to,
  };
}

class TumOnlineEndpointEventDelete extends TumOnlineEndpoint {
  final String eventId;

  TumOnlineEndpointEventDelete({required this.eventId});

  @override
  Map<String, String> getParameters() => {"pTerminNr": eventId};
}
