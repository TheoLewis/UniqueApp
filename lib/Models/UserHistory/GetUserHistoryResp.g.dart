// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetUserHistoryResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserHistoryResp _$GetUserHistoryRespFromJson(Map<String, dynamic> json) =>
    GetUserHistoryResp(
      json['Success'] as int?,
      json['Msg'] as String?,
      (json['History'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserHistoryRespToJson(GetUserHistoryResp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Msg', instance.msg);
  writeNotNull('History', instance.history);
  return val;
}

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      json['LogID'] as int?,
      json['SignInDate'] as String?,
      json['SB64'] as String?,
    );

Map<String, dynamic> _$HistoryToJson(History instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogID', instance.logID);
  writeNotNull('SignInDate', instance.signInDate);
  writeNotNull('SB64', instance.signatureBase64);
  return val;
}
