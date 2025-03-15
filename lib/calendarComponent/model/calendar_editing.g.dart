// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_editing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarCreationConfirmation _$CalendarCreationConfirmationFromJson(
  Map<String, dynamic> json,
) => CalendarCreationConfirmation(eventId: json['nr'] as String);

Map<String, dynamic> _$CalendarCreationConfirmationToJson(
  CalendarCreationConfirmation instance,
) => <String, dynamic>{'nr': instance.eventId};

CalendarCreationConfirmationData _$CalendarCreationConfirmationDataFromJson(
  Map<String, dynamic> json,
) => CalendarCreationConfirmationData(
  calendarCreationConfirmation: CalendarCreationConfirmation.fromJson(
    json['termin'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CalendarCreationConfirmationDataToJson(
  CalendarCreationConfirmationData instance,
) => <String, dynamic>{'termin': instance.calendarCreationConfirmation};

CalendarDeletionConfirmation _$CalendarDeletionConfirmationFromJson(
  Map<String, dynamic> json,
) => CalendarDeletionConfirmation(status: json['delete'] as String);

Map<String, dynamic> _$CalendarDeletionConfirmationToJson(
  CalendarDeletionConfirmation instance,
) => <String, dynamic>{'delete': instance.status};

CalendarDeletionConfirmationData _$CalendarDeletionConfirmationDataFromJson(
  Map<String, dynamic> json,
) => CalendarDeletionConfirmationData(
  calendarDeletionConfirmation: CalendarDeletionConfirmation.fromJson(
    json['termin'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CalendarDeletionConfirmationDataToJson(
  CalendarDeletionConfirmationData instance,
) => <String, dynamic>{'termin': instance.calendarDeletionConfirmation};
