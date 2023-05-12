// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['nr'] as String,
      status: json['status'] as String,
      url: json['url'] as String,
      title: json['title'] as String,
      descriptionText: json['description'] as String,
      startDate: DateTime.parse(json['dtstart'] as String),
      endDate: DateTime.parse(json['dtend'] as String),
      location: json['location'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'nr': instance.id,
      'status': instance.status,
      'url': instance.url,
      'title': instance.title,
      'description': instance.descriptionText,
      'dtstart': instance.startDate.toIso8601String(),
      'dtend': instance.endDate.toIso8601String(),
      'location': instance.location,
    };

EventData _$EventDataFromJson(Map<String, dynamic> json) => EventData(
      events: Events.fromJson(json['events'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDataToJson(EventData instance) => <String, dynamic>{
      'events': instance.events,
    };

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      event: (json['event'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'event': instance.event,
    };
