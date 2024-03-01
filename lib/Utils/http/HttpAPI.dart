import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'Base/POST.dart';
import 'ErrorResponse/ErrorResponse.dart';

class HttpAPI {
  static Duration REQUEST_TIMEOUT_TIME = Duration(seconds: 30);

  var apiUrl = "unique.iworkr.app";
  static int lastTransactionTime = 0;

  var guestAuthKey = "GUESTAUTHKEY";
  static var authKey = "AUTHKEY";

  Stopwatch stopWatch = Stopwatch();

  HttpAPI() {}

  Future<HttpResponse?> postAUTH(dynamic jsonIn, String method,
      {String? authKey}) async {
    String jsonInEncoded = "";
    if (jsonIn is Map<String, dynamic>) {
      jsonInEncoded = json.encode(jsonIn);
    } else {
      jsonInEncoded = jsonIn;
    }

    var urlPath = "/api/$method";

    stopWatch.reset();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": authKey ?? "GUESTAUTHKEY"
    };

    Map<String, String> queries = {};

    return await POST.execute(
        jsonInEncoded, apiUrl, urlPath, headers, queries, stopWatch);
  }

  Future<HttpResponse?> postNOAUTH(dynamic jsonIn, String method) async {
    final String path = '/internal/$method';
    stopWatch.reset();
    String jsonInEncoded = "";
    if (jsonIn is Map<String, dynamic>) {
      jsonInEncoded = json.encode(jsonIn);
    } else {
      jsonInEncoded = jsonIn;
    }

    Map<String, String> headers = {
      "Content-Type": "unique/login",
      "Authorization": "GUESTAUTHKEY",
    };

    Map<String, String> queries = {};
    if (kDebugMode) {
      queries["debug"] = "true";
    }

    return await POST.execute(
        jsonInEncoded, apiUrl, path, headers, queries, stopWatch);
  }
}

class HttpResponse {
  int? statusCode;
  dynamic body;
  ErrorResponse? errorResponse;

  HttpResponse({this.statusCode, String? body, this.errorResponse}) {
    try {
      this.body = jsonDecode(body ?? "");
    } catch (e) {
      print(e.toString());
    }
  }
}
