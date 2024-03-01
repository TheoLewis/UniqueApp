// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['UID'] as int,
      name: json['Name'] as String?,
      email: json['Email'] as String?,
      lastSignInDate: json['LastSignInDate'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'UID': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Email', instance.email);
  writeNotNull('LastSignInDate', instance.lastSignInDate);
  return val;
}
