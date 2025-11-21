import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_demo/core/utils/common_widget.dart';
import 'package:flutter_app_demo/core/utils/logger.dart';
import 'package:flutter_app_demo/models/main_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiCallMethods {
  // static final baseUrl = "http://192.168.1.71:9087/api/api/";
  // static final baseUrl = "http://192.168.1.71:9087/api/api/";


  static checkInternet() async {
    try {
      if (kIsWeb) {
        return true;
      }
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (err) {
      printText("inside catch $err");
      return false;
    }
  }

  static getHeaders({ contentType = "application/json"}) {

      var headers = {'Content-Type': 'application/json'};
      printText('headers-------------------$headers');
      return headers;
  }

  static Future<http.Response> httpRequest({
    required String url,
    required methodType,
    var data,
  }) async {
    printText("Request body  ---------------------${json.encode(data)}");


    if (methodType && await checkInternet()) {
      if (data != null) {
        return await http.post(
          Uri.parse(url),
          body: json.encode(data),
          headers: Map<String, String>.from(getHeaders()),
          encoding: utf8,
        );
      } else {
        return await http.post(
          Uri.parse(url),
          headers: Map<String, String>.from(getHeaders()),
          encoding: utf8,
        );
      }
    } else {
      return await http.get(
        Uri.parse(url),
        headers: Map<String, String>.from(getHeaders()),
      );
    }
  }

  static Future<http.Response> post({
    required String url,
    var data,
  }) async {
    await checkInternet();
    return httpRequest(
      url: url,
      data: data,
      methodType: true,
    );
  }

  static Future<http.Response> get({
    required String url,
  }) async {
    printText('get Requested url--------------$url');
    await checkInternet();
    return httpRequest(
      url: url,
      methodType: false,
    );
  }

  static checkResponse({required http.Response response}) {
    final mainResponse = MainResponseModel.fromJson(
      json.decode(response.body) as Map<String, dynamic>,
    );
    if (response.statusCode == 200 ) {
      if (mainResponse.status == "success") {
        printText("*********** request for ${response.request?.url} ");
        printText(
          "response data => ${json.encode(mainResponse.data)} ***********",
        );

        return mainResponse;
      } else {
        showToast(mainResponse.message);
        throw ApiException(mainResponse.message, "");
      }
    } else {
      throw ApiException("${mainResponse.message}", "");
    }
  }
}

class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix $_message";
  }
}
