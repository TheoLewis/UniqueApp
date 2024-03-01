import 'package:json_annotation/json_annotation.dart';
part 'InsertSignInLogReq.g.dart';

@JsonSerializable(includeIfNull: false)
class InsertSignInLogReq {
  @JsonKey(name: 'UID')
  int? uID;
  @JsonKey(name: 'SB64')
  String? sB64;

  InsertSignInLogReq(this.uID, this.sB64);

  static List<InsertSignInLogReq> fromArray(List<dynamic> list) {
    List<InsertSignInLogReq> result = [];
    list.forEach((item) {
      result.add(InsertSignInLogReq.fromJson(item));
    });
    return result;
  }

  factory InsertSignInLogReq.fromJson(Map<String, dynamic> json) =>
      _$InsertSignInLogReqFromJson(json);

  Map<String, dynamic> toJson() => _$InsertSignInLogReqToJson(this);
}
