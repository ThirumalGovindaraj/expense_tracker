import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'validation_utils.dart';
import 'web_service_constants.dart';

class WebServiceHelper {
  static WebServiceHelper _instance = WebServiceHelper.internal();

  WebServiceHelper.internal();

  factory WebServiceHelper() => _instance;

  /// Get API call
  Future<dynamic> get(String url,
      {Map<String, String> headers = const {},
      bool isOAuthTokenNeeded = true}) async {
    final http.Response response = await http
        .get(Uri.parse(url), headers: headers)
        .timeout(
            const Duration(
                seconds: WebserviceConstants.apiServiceTimeOutInSeconds),
            onTimeout: _onTimeOut);
    // if (ValidationUtils.isSuccessResponse(response.statusCode)) {
    return jsonDecode(response.body);
    // } else {
    //   return response.body;
    // }
  }

  /// Post API call
  Future<dynamic> post(String url,
      {Map<String, String> headers = const {},
      Map<String, String> params = const {},
      body,
      encoding,
      bool isOAuthTokenNeeded = true}) async {
    final response = await http
        .post(
          Uri.parse(url),
          headers: {

    "Content-Type": "application/json"
    },
          body: body,
        )
        .timeout(
            const Duration(
                seconds: WebserviceConstants.apiServiceTimeOutInSeconds),
            onTimeout: _onTimeOut);
    return jsonDecode(response.body);
    // }
  }

  /// Post API call
  Future<dynamic> put(String url,
      {Map<String, String> params = const {},
      body,
      Map<String, String> headers = const {},
      encoding,
      bool isOAuthTokenNeeded = true}) async {
    final response = await http
        .put(Uri.parse(url), headers: headers, body: body, encoding: encoding)
        .timeout(
            const Duration(
                seconds: WebserviceConstants.apiServiceTimeOutInSeconds),
            onTimeout: _onTimeOut);
    if (ValidationUtils.isSuccessResponse(response.statusCode)) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// Post API call
  Future<dynamic> delete(String url, Map<String, String> headers,
      {Map<String, String> params = const {},
      body,
      encoding,
      bool isOAuthTokenNeeded = true}) async {
    // headers = isOAuthTokenNeeded ? await addConfigHeaders() : headers;
    final response = await http
        .delete(
          Uri.parse(url),
          headers: headers,
        )
        .timeout(
            Duration(seconds: WebserviceConstants.apiServiceTimeOutInSeconds),
            onTimeout: _onTimeOut);
    if (ValidationUtils.isSuccessResponse(response.statusCode)) {
      return response.body;
    } else {
      return response.body;
    }
  }

  http.Response _onTimeOut() {
    http.Response response =
        http.Response(jsonEncode({"error": "TimeOut"}), 500);

    return response;
  }

  String contentType = 'application/json';
}
