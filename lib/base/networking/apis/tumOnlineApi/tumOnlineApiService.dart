sealed class TUMOnlineService {
  Map<String, String> getParameters() => {};
}

class TUMOnlineServiceTokenRequest extends TUMOnlineService {
  final String tumId;
  final String deviceName;

  TUMOnlineServiceTokenRequest({
    required this.tumId,
    required this.deviceName
  });

  @override
  Map<String, String> getParameters() => {
    "pUsername": tumId,
    "pTokenName": deviceName
  };
}

class TUMOnlineServiceTokenConfirmation extends TUMOnlineService {}

class TUMOnlineServiceTuitionStatus extends TUMOnlineService {}

class TUMOnlineServiceCalendar extends TUMOnlineService {}

class TUMOnlineServicePersonSearch extends TUMOnlineService {
  final String search;

  TUMOnlineServicePersonSearch({required this.search});

  @override
  Map<String, String> getParameters() => {
    "pSuche": search
  };
}

class TUMOnlineServicePersonDetails extends TUMOnlineService {
  final String identNumber;

  TUMOnlineServicePersonDetails({required this.identNumber});

  @override
  Map<String, String> getParameters() => {
    "pIdentNr": identNumber
  };
}

class TUMOnlineServicePersonalLectures extends TUMOnlineService {}

class TUMOnlineServicePersonalGrades extends TUMOnlineService {}

class TUMOnlineServiceLectureSearch extends TUMOnlineService {
  final String search;

  TUMOnlineServiceLectureSearch({required this.search});

  @override
  Map<String, String> getParameters() => {
    "pSuche": search
  };
}

class TUMOnlineServiceLectureDetails extends TUMOnlineService {
  final String lvNr;

  TUMOnlineServiceLectureDetails({required this.lvNr});

  @override
  Map<String, String> getParameters() => {
    "pLVNr": lvNr
  };
}

class TUMOnlineServiceIdentify extends TUMOnlineService {}

class TUMOnlineServiceSecretUpload extends TUMOnlineService {}

class TUMOnlineServiceProfileImage extends TUMOnlineService {
  final String personGroup;
  final String id;

  TUMOnlineServiceProfileImage({required this.personGroup, required this.id});

  @override
  Map<String, String> getParameters() => {
    "pPersonenGruppe": personGroup,
    "pPersonenId": id
  };
}