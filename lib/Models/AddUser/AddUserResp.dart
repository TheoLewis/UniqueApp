import 'package:json_annotation/json_annotation.dart';
part 'AddUserResp.g.dart';

@JsonSerializable(includeIfNull: false)
class AddUserResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Msg')
  String? msg;
  @JsonKey(name: 'UID')
  int? uID;

  AddUserResp(this.success, this.msg, this.uID);

  static List<AddUserResp> fromArray(List<dynamic> list) {
    List<AddUserResp> result = [];
    list.forEach((item) {
      result.add(AddUserResp.fromJson(item));
    });
    return result;
  }

  factory AddUserResp.fromJson(Map<String, dynamic> json) =>
      _$AddUserRespFromJson(json);

  Map<String, dynamic> toJson() => _$AddUserRespToJson(this);
}
