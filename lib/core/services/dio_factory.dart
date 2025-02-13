import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_session_jwt/flutter_session_jwt.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:warraq/core/constants/app_apis.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio({String? baseUrl}) {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders(baseUrl);
      addDioInterceptor();
      return dio!;
    } else {
      if (baseUrl != null) addDioHeaders(baseUrl);
      return dio!;
    }
  }

  static void addDioHeaders(String? baseUrl) async {
    dio?.options.baseUrl = baseUrl ?? AppApis.baseUrl;
    final token = await FlutterSessionJwt.retrieveToken();

    if (token != null) {
      dio?.options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      dio?.options.headers = {'Accept': 'application/json'};
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
