import 'package:medoraapp/features/analysis/data/models/analysis_lab_model.dart';

class AnalysisLabViewModel {
  final AnalysisLabModel model;

  AnalysisLabViewModel(this.model);

  String get displayPrice => "${model.price}€";
  String get displayDuration => model.duration;
}
