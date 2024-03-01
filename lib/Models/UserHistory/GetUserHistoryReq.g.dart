// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetUserHistoryReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserHistoryReq _$GetUserHistoryReqFromJson(Map<String, dynamic> json) =>
    GetUserHistoryReq(
      json['UserId'] as int?,
    );

Map<String, dynamic> _$GetUserHistoryReqToJson(GetUserHistoryReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserId', instance.userId);
  return val;
}
