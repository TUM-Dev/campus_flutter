import 'package:json_annotation/json_annotation.dart';

part 'calendar_editing.g.dart';

class AddedCalendarEvent {
  final String title;
  final String? annotation;
  final DateTime from;
  final DateTime to;

  AddedCalendarEvent({
    required this.title,
    this.annotation,
    required this.from,
    required this.to,
  });
}

@JsonSerializable()
class CalendarCreationConfirmation {
  @JsonKey(name: "nr")
  final String eventId;

  CalendarCreationConfirmation({
    required this.eventId,
  });

  factory CalendarCreationConfirmation.fromJson(Map<String, dynamic> json) =>
      _$CalendarCreationConfirmationFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarCreationConfirmationToJson(this);
}

@JsonSerializable()
class CalendarCreationConfirmationData {
  @JsonKey(name: "termin")
  final CalendarCreationConfirmation calendarCreationConfirmation;

  CalendarCreationConfirmationData({
    required this.calendarCreationConfirmation,
  });

  factory CalendarCreationConfirmationData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CalendarCreationConfirmationDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalendarCreationConfirmationDataToJson(this);
}

@JsonSerializable()
class CalendarDeletionConfirmation {
  @JsonKey(name: "delete")
  final String status;

  CalendarDeletionConfirmation({
    required this.status,
  });

  factory CalendarDeletionConfirmation.fromJson(Map<String, dynamic> json) =>
      _$CalendarDeletionConfirmationFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarDeletionConfirmationToJson(this);
}

@JsonSerializable()
class CalendarDeletionConfirmationData {
  @JsonKey(name: "termin")
  final CalendarDeletionConfirmation calendarDeletionConfirmation;

  CalendarDeletionConfirmationData({
    required this.calendarDeletionConfirmation,
  });

  factory CalendarDeletionConfirmationData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CalendarDeletionConfirmationDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalendarDeletionConfirmationDataToJson(this);
}
