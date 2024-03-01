import 'package:json_annotation/json_annotation.dart';

import '../User/User.dart';
part 'GetUsersResp.g.dart';

@JsonSerializable(includeIfNull: false)
class GetUsersResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Msg')
  String? msg;
  @JsonKey(name: 'Users')
  List<User>? users;

  GetUsersResp(this.success, this.msg, this.users);

  static List<GetUsersResp> fromArray(List<dynamic> list) {
    List<GetUsersResp> result = [];
    list.forEach((item) {
      result.add(GetUsersResp.fromJson(item));
    });
    return result;
  }

  factory GetUsersResp.fromJson(Map<String, dynamic> json) =>
      _$GetUsersRespFromJson(json);

  Map<String, dynamic> toJson() => _$GetUsersRespToJson(this);
}
