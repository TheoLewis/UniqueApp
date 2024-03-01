// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InsertSignInLogResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertSignInLogResp _$InsertSignInLogRespFromJson(Map<String, dynamic> json) =>
    InsertSignInLogResp(
      json['Success'] as int?,
      json['Msg'] as String?,
      json['LSID'] as String?,
    );

Map<String, dynamic> _$InsertSignInLogRespToJson(InsertSignInLogResp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Msg', instance.msg);
  writeNotNull('LSID', instance.lastSignInDate);
  return val;
}
