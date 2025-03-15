// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionBody _$ExceptionBodyFromJson(Map<String, dynamic> json) =>
    ExceptionBody(
      exceptionMessage: ExceptionMessage.fromJson(
        json['error'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ExceptionBodyToJson(ExceptionBody instance) =>
    <String, dynamic>{'error': instance.exceptionMessage};

ExceptionMessage _$ExceptionMessageFromJson(Map<String, dynamic> json) =>
    ExceptionMessage(message: json['message'] as String);

Map<String, dynamic> _$ExceptionMessageToJson(ExceptionMessage instance) =>
    <String, dynamic>{'message': instance.message};
