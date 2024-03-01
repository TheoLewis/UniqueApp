import 'package:json_annotation/json_annotation.dart';
part 'GetUserHistoryReq.g.dart';

@JsonSerializable(includeIfNull: false)
class GetUserHistoryReq {
  @JsonKey(name: 'UserId')
  int? userId;

  GetUserHistoryReq(this.userId);

  static List<GetUserHistoryReq> fromArray(List<dynamic> list) {
    List<GetUserHistoryReq> result = [];
    list.forEach((item) {
      result.add(GetUserHistoryReq.fromJson(item));
    });
    return result;
  }

  factory GetUserHistoryReq.fromJson(Map<String, dynamic> json) =>
      _$GetUserHistoryReqFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserHistoryReqToJson(this);
}
