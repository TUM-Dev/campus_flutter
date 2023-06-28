sealed class TumOnlineService {
  Map<String, String> getParameters() => {};
}

class TumOnlineServiceTokenRequest extends TumOnlineService {
  final String tumId;
  final String deviceName;

  TumOnlineServiceTokenRequest({
    required this.tumId,
    required this.deviceName
  });

  @override
  Map<String, String> getParameters() => {
    "pUsername": tumId,
    "pTokenName": deviceName
  };
}

class TumOnlineServiceTokenConfirmation extends TumOnlineService {}

class TumOnlineServiceTuitionStatus extends TumOnlineService {}

class TumOnlineServiceCalendar extends TumOnlineService {}

class TumOnlineServicePersonSearch extends TumOnlineService {
  final String search;

  TumOnlineServicePersonSearch({required this.search});

  @override
  Map<String, String> getParameters() => {
    "pSuche": search
  };
}

class TumOnlineServicePersonDetails extends TumOnlineService {
  final String identNumber;

  TumOnlineServicePersonDetails({required this.identNumber});

  @override
  Map<String, String> getParameters() => {
    "pIdentNr": identNumber
  };
}

class TumOnlineServicePersonalLectures extends TumOnlineService {}

class TumOnlineServicePersonalGrades extends TumOnlineService {}

class TumOnlineServiceLectureSearch extends TumOnlineService {
  final String search;

  TumOnlineServiceLectureSearch({required this.search});

  @override
  Map<String, String> getParameters() => {
    "pSuche": search
  };
}

class TumOnlineServiceLectureDetails extends TumOnlineService {
  final String lvNr;

  TumOnlineServiceLectureDetails({required this.lvNr});

  @override
  Map<String, String> getParameters() => {
    "pLVNr": lvNr
  };
}

class TumOnlineServiceIdentify extends TumOnlineService {}

class TumOnlineServiceSecretUpload extends TumOnlineService {}

class TumOnlineServiceProfileImage extends TumOnlineService {
  final String personGroup;
  final String id;

  TumOnlineServiceProfileImage({required this.personGroup, required this.id});

  @override
  Map<String, String> getParameters() => {
    "pPersonenGruppe": personGroup,
    "pPersonenId": id
  };
}