import 'package:json_annotation/json_annotation.dart';
part 'InsertSignInLogResp.g.dart';

@JsonSerializable(includeIfNull: false)
class InsertSignInLogResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Msg')
  String? msg;
  @JsonKey(name: 'LSID')
  String? lastSignInDate;

  InsertSignInLogResp(this.success, this.msg, this.lastSignInDate);

  static List<InsertSignInLogResp> fromArray(List<dynamic> list) {
    List<InsertSignInLogResp> result = [];
    list.forEach((item) {
      result.add(InsertSignInLogResp.fromJson(item));
    });
    return result;
  }

  factory InsertSignInLogResp.fromJson(Map<String, dynamic> json) =>
      _$InsertSignInLogRespFromJson(json);

  Map<String, dynamic> toJson() => _$InsertSignInLogRespToJson(this);
}
