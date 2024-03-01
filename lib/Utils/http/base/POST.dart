import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../ErrorResponse/ErrorResponse.dart';
import '../HttpAPI.dart';

class POST {
  static Future<HttpResponse?> execute(jsonIn, url, path, headers,
      Map<String, String> queries, Stopwatch stopWatch) async {
    jsonIn = _fixJsonRemoveWhitespace(jsonIn);

    final uri = Uri.https(url, path, queries);

    final encoding = Encoding.getByName('utf-8');

    debugPrint("\n  //--- HTTP API ---\\\\");
    debugPrint(
        "\n  --- Request ---  \n   POST (Auth)\n   URL -\n      ${uri.toString()}\n   Headers -\n");
    headers.forEach((key, value) {
      debugPrint("      $key = $value\n");
    });
    debugPrint("     Queries -\n");
    uri.queryParameters.forEach((key, value) {
      debugPrint("      $key = $value\n");
    });
    debugPrint("   Body -\n$jsonIn");
    debugPrint(" --- END ---  \n");
    debugPrint("   Sending Request...");

    stopWatch.reset();
    stopWatch.start();

    try {
      Response response = await post(
        uri,
        body: jsonIn,
        headers: headers,
        encoding: encoding,
      ).timeout(
        HttpAPI.REQUEST_TIMEOUT_TIME,
        onTimeout: () {
          return Response('{"Error":"Timeout Error"}', 666);
        },
      );

      stopWatch.stop();
      HttpAPI.lastTransactionTime = stopWatch.elapsedMilliseconds;
      debugPrint(
          "   Response Received (${HttpAPI.lastTransactionTime}ms)\n   STATUS ${response.statusCode}");

      int statusCode = response.statusCode;
      String responseBody = response.body;

      debugPrint("  Body Received - ${responseBody}\n");

      if (statusCode != 200) {
        try {
          if (statusCode == 666) {
            return null;
          }
          debugPrint(
              "   HttpAPI ERROR - \n      HTTP Request Failed with Result $statusCode\n${responseBody}");
          var responseDecoded =
              ErrorResponse.fromJson(jsonDecode(responseBody));

          return HttpResponse(
              statusCode: statusCode,
              body: responseBody,
              errorResponse: responseDecoded);
        } catch (e) {
          return HttpResponse(statusCode: statusCode, body: responseBody);
        }
      }

      try {
        return HttpResponse(statusCode: statusCode, body: responseBody);
      } catch (e) {
        //No json body returned
        return null;
      }
    } catch (e) {
      debugPrint("   HttpAPI ERROR -\n      ${e.toString()}");
      return null;
    }
  }

  static _fixJsonRemoveWhitespace(String jsonIn) {
    jsonIn = (jsonIn.replaceAll(RegExp(' "'), '"'));
    return (jsonIn.replaceAll(RegExp('" '), '"'));
  }
}
