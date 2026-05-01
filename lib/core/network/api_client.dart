import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/core/storage/token_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final Dio dio;

  factory ApiClient() => _instance;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _addInterceptors();
  }

  static const String _baseUrl = "http://192.168.144.128:8000/api/";
  // static const String _baseUrl = "http://192.168.1.105:8000/api/";
  // static const String _baseUrl = "http://10.114.113.128:8000/api/";

  void _addInterceptors() {
    // 🔐 Token + Network Check
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 🌐 check internet
          final connectivity = await Connectivity().checkConnectivity();
          if (connectivity == ConnectivityResult.none) {
            return handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionError,
              ),
            );
          }

          // 🔑 add token
          final token = await TokenStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );

    // 🧠 تحويل الأخطاء
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          final apiException = _mapToApiException(error);

          final newError = DioException(
            requestOptions: error.requestOptions,
            response: error.response,
            type: error.type,
            error: apiException,
          );

          handler.next(newError);
        },
      ),
    );

    // 🐞 Logging
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  ApiException _mapToApiException(DioException e) {
    if (e.type == DioExceptionType.connectionError) {
      return const ApiException(type: ApiExceptionType.network);
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const ApiException(type: ApiExceptionType.timeout);
    }

    final statusCode = e.response?.statusCode;
    final message = e.response?.data?['message'];

    return ApiException.fromStatusCode(statusCode, message);
  }
}
