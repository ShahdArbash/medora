import 'package:medoraapp/core/utils/icon_mapper.dart';

class AnalysisCategoryModel {
  final String title;
  final int id;
  final int testsCount;
  final String iconName;

  const AnalysisCategoryModel({
    required this.title,
    required this.id,
    required this.testsCount,
    required this.iconName,
  });

  factory AnalysisCategoryModel.fromJson(Map<String, dynamic> json) {
    return AnalysisCategoryModel(
      title: json['name'] ?? '',
      id: json['id'] ?? 0,

      testsCount: json['master_tests_count'] ?? 0,

      iconName: CategoryIconMapper.mapBackendIcon(json['icon']),
    );
  }
}
