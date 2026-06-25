import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/analysis/data/models/analysis_labs_response.dart';

class AnalysisLabsService {
  final ApiClient apiClient = ApiClient();

  Future<AnalysisLabsResponse> fetchSortedLabs(
    int analysisId,
    String sortBy,
  ) async {
    final response = await apiClient.client.get(
      "/tests/$analysisId/search",
      queryParameters: {"sort_by": sortBy},
    );

    return AnalysisLabsResponse.fromJson(response.data);
  }
}
