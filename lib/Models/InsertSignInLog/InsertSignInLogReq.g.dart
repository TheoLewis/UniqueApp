// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InsertSignInLogReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertSignInLogReq _$InsertSignInLogReqFromJson(Map<String, dynamic> json) =>
    InsertSignInLogReq(
      json['UID'] as int?,
      json['SB64'] as String?,
    );

Map<String, dynamic> _$InsertSignInLogReqToJson(InsertSignInLogReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UID', instance.uID);
  writeNotNull('SB64', instance.sB64);
  return val;
}
