import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dms_portal/common/endpoint.dart';
import 'package:dms_portal/enitity/ApiResponse.dart';
import 'package:dms_portal/enitity/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  _checkNetwork() async {
    return await (Connectivity().checkConnectivity());
  }

  final BaseOptions options = new BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 30000,
      responseType: ResponseType.json,
      receiveTimeout: 30000,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });

  Future<ApiResponse> userLogin(String email, String password) async {
    var _net = await _checkNetwork();
    if (_net == ConnectivityResult.none) {
      throw "Internet connection not found";
    }

    Map<String, dynamic> payload = {
      "email": email,
      "password": password,
    };

    Dio dio = Dio(options);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    Response response;
    try {
      response = await dio.post(LOGIN, data: payload);
    } catch (e) {
      return ApiResponse(
        code: 400,
        message: "Request failed",
        data: null,
      );
    }

    if (response.statusCode != 200) {
      return ApiResponse(
        code: response.statusCode!.toInt(),
        message: response.statusMessage,
        data: null,
      );
    }

    Map<String, dynamic> json = Map<String, dynamic>.from(response.data);
    ApiResponse apiResponse = ApiResponse(
      code: response.statusCode!.toInt(),
      message: null,
      data: Login.fromJson(json['data']),
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", (apiResponse.data as Login).token);
    return apiResponse;
  }
}
