import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/shared/constants/app_values.dart';
import 'package:weather_app/shared/utils/utils.dart';

/// Class that makes API call easier
class DioManager {
  Dio? _dioInstance;

  Dio? get dio {
    _dioInstance ??= initDio();
    return _dioInstance;
  }

  Dio initDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppValues.baseUrl,
        headers: <String, String> {},
        sendTimeout: 30000,
        connectTimeout: 20000,
        receiveTimeout: 60000,
      ),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }
    return dio;
  }

  /// DIO GET
  /// take [url], concrete route
  Future<Response> get(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? json,
      }) async => await dio!.get(url, queryParameters: json, options: Options(headers: headers)).then((response) => response).catchError((error) {
    errorSnackBar(
      code: error.response?.statusCode?.toString() ?? '',
      message: error.response?.data?['message']?? '',
    );
  },
  );

  /// DIO POST
  /// take [url], concrete route
  Future<Response> post(
      String url, {
        Map<String, dynamic>? headers,
        body,
        encoding,
        Options? options,
      }) async => await dio!.post(url, data: body, options: options ?? Options(headers: headers)).then((response) => response).catchError(
        (error) {
      if (error.response!.statusCode == 500 || error.response!.statusCode == 502) {
        errorSnackBar(
          code: error.response?.statusCode?.toString() ?? '',
          message: error.response?.data ?? '',
        );
      } else {
        errorSnackBar(
          code: error.response?.statusCode?.toString() ?? '',
          message: error.response?.data?['message'] ?? '',
        );
      }
    },
  );

  /// DIO PUT
  /// take [url], concrete route
  Future<Response> put(String url, {body, encoding, Options? options}) async {
    return await dio!.put(url, data: body, options: options).then((response) {
      return response;
    }).catchError((error) {
      errorSnackBar(
        code: error.response?.statusCode?.toString() ?? '',
        message: error.response?.data?['message'] ?? '',
      );
    });
  }

  /// DIO DELETE
  /// take [url], concrete route
  Future<Response> delete(
      String url, {
        Map<String, dynamic>? headers,
        body,
        encoding,
      }) async => await dio!.delete(url, data: body, options: Options(headers: headers)).then((response) {
    return response;
  }).catchError((error) {
    errorSnackBar(
      code: error.response?.statusCode?.toString() ?? '',
      message: error.response?.data?['message'] ?? '',
    );
  });
}
