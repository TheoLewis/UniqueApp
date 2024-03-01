// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddUserReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserReq _$AddUserReqFromJson(Map<String, dynamic> json) => AddUserReq(
      json['Name'] as String?,
      json['Email'] as String?,
    );

Map<String, dynamic> _$AddUserReqToJson(AddUserReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Email', instance.email);
  return val;
}
