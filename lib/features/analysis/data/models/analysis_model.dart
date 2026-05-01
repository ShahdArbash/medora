class AnalysisModel {
  final int id;
  final int categoryId;
  final String name;
  final String shortName;
  final String sampleType;
  final String unit;
  final String normalRange;
  final String description;

  AnalysisModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.shortName,
    required this.sampleType,
    required this.unit,
    required this.normalRange,
    required this.description,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    return AnalysisModel(
      id: json['id'] ?? 0,
      categoryId: json['test_category_id'] ?? 0,
      name: json['name'] ?? '',
      shortName: json['short_name'] ?? '',
      sampleType: json['sample_type'] ?? '',
      unit: json['unit'] ?? '',
      normalRange: json['normal_range'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
