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
  static const String _baseUrl =
      "https://legacy-cubical-swampland.ngrok-free.dev/api/";

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final connectivity = await Connectivity().checkConnectivity();

          if (connectivity == ConnectivityResult.none) {
            return handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionError,
              ),
            );
          }

          final token = await TokenStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          final apiException = _mapToApiException(error);

          handler.next(
            DioException(
              requestOptions: error.requestOptions,
              response: error.response,
              type: error.type,
              error: apiException,
            ),
          );
        },
      ),
    );

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
    final data = e.response?.data;

    String? message;
    Map<String, dynamic>? errors;

    if (data is Map) {
      // 🔥 Laravel validation errors
      if (data['errors'] is Map) {
        errors = Map<String, dynamic>.from(data['errors']);
      }

      // 🔥 fallback (your current backend style)
      if (data['data'] is List && data['data'].isNotEmpty) {
        message = data['data'][0];
      } else if (data['message'] is String) {
        message = data['message'];
      }
    }

    return ApiException.fromStatusCode(statusCode, message, errors);
  }

  Dio get client => dio;
}
