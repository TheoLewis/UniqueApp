import 'package:json_annotation/json_annotation.dart';
part 'AddUserReq.g.dart';

@JsonSerializable(includeIfNull: false)
class AddUserReq {
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'Email')
  String? email;

  AddUserReq(this.name, this.email);

  static List<AddUserReq> fromArray(List<dynamic> list) {
    List<AddUserReq> result = [];
    list.forEach((item) {
      result.add(AddUserReq.fromJson(item));
    });
    return result;
  }

  factory AddUserReq.fromJson(Map<String, dynamic> json) =>
      _$AddUserReqFromJson(json);

  Map<String, dynamic> toJson() => _$AddUserReqToJson(this);
}
