import 'package:dio/dio.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/core/network/api_client.dart';

class ApiService {
  final Dio apiClient = ApiClient().dio;

  Future<Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await apiClient.get(path);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  ApiException _handleError(DioException e) {
    if (e.error is ApiException) {
      return e.error as ApiException;
    }

    return const ApiException(type: ApiExceptionType.unknown);
  }
}
