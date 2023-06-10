// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorBody _$ErrorFromJson(Map<String, dynamic> json) => ErrorBody(
      errorMessage:
          ErrorMessage.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorToJson(ErrorBody instance) => <String, dynamic>{
      'error': instance.errorMessage,
    };

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
