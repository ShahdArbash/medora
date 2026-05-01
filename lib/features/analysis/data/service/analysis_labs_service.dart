import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_labs_response.dart';

class AnalysisLabsService {
  final ApiClient apiClient = ApiClient();

  Future<AnalysisLabsResponse> fetchLabs(int analysisId) async {
    final response = await apiClient.dio.get("tests/$analysisId/search");

    return AnalysisLabsResponse.fromJson(response.data);
  }
}
