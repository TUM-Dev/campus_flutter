// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarEvent _$CalendarEventFromJson(Map<String, dynamic> json) =>
    CalendarEvent(
      id: json['nr'] as String,
      status: json['status'] as String,
      url: json['url'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      startDate: DateTime.parse(json['dtstart'] as String),
      endDate: DateTime.parse(json['dtend'] as String),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$CalendarEventToJson(CalendarEvent instance) =>
    <String, dynamic>{
      'nr': instance.id,
      'status': instance.status,
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'dtstart': instance.startDate.toIso8601String(),
      'dtend': instance.endDate.toIso8601String(),
      'location': instance.location,
    };

CalendarEvents _$CalendarEventsFromJson(Map<String, dynamic> json) =>
    CalendarEvents(
      events: (json['event'] as List<dynamic>?)
              ?.map((e) => CalendarEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CalendarEventsToJson(CalendarEvents instance) =>
    <String, dynamic>{
      'event': instance.events,
    };
