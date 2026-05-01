import 'package:medoraapp/features/analysis/data/models/analysis_lab_model.dart';

class AnalysisLabsResponse {
  final List<AnalysisLabModel> labs;
  final int totalCount;
  final int filteredCount;

  AnalysisLabsResponse({
    required this.labs,
    required this.totalCount,
    required this.filteredCount,
  });

  factory AnalysisLabsResponse.fromJson(Map<String, dynamic> json) {
    final labsList = json['data']['laboratories'] as List;

    return AnalysisLabsResponse(
      labs: labsList.map((e) => AnalysisLabModel.fromJson(e)).toList(),
      totalCount: json['total_count'] ?? labsList.length,
      filteredCount: json['filtered_count'] ?? labsList.length,
    );
  }
}
