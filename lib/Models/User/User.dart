import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  @JsonKey(name: 'UID')
  int userId;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'Email')
  String? email;
  @JsonKey(name: 'LastSignInDate')
  String? lastSignInDate;

  User({required this.userId, this.name, this.email, this.lastSignInDate});

  static List<User> fromArray(List<dynamic> list) {
    List<User> result = [];
    list.forEach((item) {
      result.add(User.fromJson(item));
    });
    return result;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
