import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:warraq/core/services/locator.dart';
import 'package:warraq/core/utils/errors/error_code.dart';
import 'package:warraq/core/utils/errors/exceptions.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient(this._dio);

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    await checkInternet();
    return await _dio.get(
      url,
      queryParameters: queryParameters,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          log("${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }

  Future<Response<T>> post<T>(String url,
      {required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters, Options? options}) async {
    await checkInternet();
    return _dio.post<T>(
      url,
      data: data,
      options: options,
      queryParameters: queryParameters,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          log("${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }

  Future<Response> put(String url,
      {required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters}) async {
    await checkInternet();
    return await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          log("${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
  }

  Future<Response> delete(String url) async {
    await checkInternet();
    return await _dio.delete(url);
  }

  Future<Response> download(String url, String pathName,
      void Function(int count, int total)? onReceiveProgress) async {
    Response response;
    response = await _dio.download(
      url,
      pathName,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  static Future<void> checkInternet() async {
    bool internetState =
        await ServiceLocator.networkController.checkConnectivity();
    if (!internetState) {
      throw InternetException(
          code: RemoteErrorCode.CONNECTION_INTERUPTED_ERROR_CODE);
    }
  }
}
