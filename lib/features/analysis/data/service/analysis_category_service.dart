import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/error/api_exception.dart';
import '../models/analysis_category_model.dart';

class AnalysisCategoryService {
  final ApiClient apiClient = ApiClient();

  Future<List<AnalysisCategoryModel>> fetchCategories() async {
    try {
      final response = await apiClient.dio.get("categories");

      final List data = response.data['data'];

      return data.map((e) => AnalysisCategoryModel.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const ApiException(type: ApiExceptionType.network);
      }

      if (e.response != null) {
        throw ApiException(
          type: ApiExceptionType.server,
          statusCode: e.response?.statusCode,
          serverMessage: e.response?.data["message"],
        );
      }

      throw const ApiException(type: ApiExceptionType.unknown);
    } catch (_) {
      throw const ApiException(type: ApiExceptionType.unknown);
    }
  }
}
