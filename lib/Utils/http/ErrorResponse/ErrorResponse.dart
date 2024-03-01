import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'ErrorResponse.g.dart';

@JsonSerializable(includeIfNull: false)
class ErrorResponse {
  @JsonKey(name: 'Title')
  String? title;
  @JsonKey(name: 'Error')
  String? errorMessage;
  @JsonKey(ignore: true)
  static ErrorResponse? lastError;

  ErrorResponse(this.errorMessage, this.title);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    var errorResponse = _$ErrorResponseFromJson(json);
    lastError = errorResponse;

    return errorResponse;
  }

  String toJson() => json.encode(_$ErrorResponseToJson(this));
}
