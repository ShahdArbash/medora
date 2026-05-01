import 'package:medoraapp/features/analysis/data/models/analysis_lab_pivot.dart';

class AnalysisLabModel {
  final int labId;
  final int analysisId;
  final String labName;
  final String location;
  final LabPivot pivot;
  final double rating;

  AnalysisLabModel({
    required this.labId,
    required this.analysisId,
    required this.labName,
    required this.location,
    required this.pivot,
    required this.rating,
  });

  factory AnalysisLabModel.fromJson(Map<String, dynamic> json) {
    return AnalysisLabModel(
      labId: json['id'],
      analysisId: json['pivot']['master_test_id'],
      labName: json['name'],
      location: json['address'],
      pivot: LabPivot.fromJson(json['pivot']),
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
  double get price => pivot.price;

  String get duration => "${pivot.estimatedTime} ساعة";
  bool get hasOffer => false;
  double? get oldPrice => null;
}
