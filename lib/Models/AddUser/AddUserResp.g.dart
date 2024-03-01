// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddUserResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserResp _$AddUserRespFromJson(Map<String, dynamic> json) => AddUserResp(
      json['Success'] as int?,
      json['Msg'] as String?,
      json['UID'] as int?,
    );

Map<String, dynamic> _$AddUserRespToJson(AddUserResp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Msg', instance.msg);
  writeNotNull('UID', instance.uID);
  return val;
}
