// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ErrorResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      json['Error'] as String?,
      json['Title'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Title', instance.title);
  writeNotNull('Error', instance.errorMessage);
  return val;
}
