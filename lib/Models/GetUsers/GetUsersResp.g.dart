// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetUsersResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResp _$GetUsersRespFromJson(Map<String, dynamic> json) => GetUsersResp(
      json['Success'] as int?,
      json['Msg'] as String?,
      (json['Users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersRespToJson(GetUsersResp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Msg', instance.msg);
  writeNotNull('Users', instance.users);
  return val;
}
