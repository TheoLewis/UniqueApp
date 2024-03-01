import 'package:json_annotation/json_annotation.dart';
part 'GetUserHistoryResp.g.dart';

@JsonSerializable(includeIfNull: false)
class GetUserHistoryResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Msg')
  String? msg;
  @JsonKey(name: 'History')
  List<History>? history;

  GetUserHistoryResp(this.success, this.msg, this.history);

  static List<GetUserHistoryResp> fromArray(List<dynamic> list) {
    List<GetUserHistoryResp> result = [];
    list.forEach((item) {
      result.add(GetUserHistoryResp.fromJson(item));
    });
    return result;
  }

  factory GetUserHistoryResp.fromJson(Map<String, dynamic> json) =>
      _$GetUserHistoryRespFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserHistoryRespToJson(this);
}

@JsonSerializable(includeIfNull: false)
class History {
  @JsonKey(name: 'LogID')
  int? logID;
  @JsonKey(name: 'SignInDate')
  String? signInDate;
  @JsonKey(name: 'SB64')
  String? signatureBase64;

  History(this.logID, this.signInDate, this.signatureBase64);

  static List<History> fromArray(List<dynamic> list) {
    List<History> result = [];
    list.forEach((item) {
      result.add(History.fromJson(item));
    });
    return result;
  }

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
