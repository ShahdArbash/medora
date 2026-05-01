import '../../../data/models/analysis_model.dart';

abstract class AnalysisState {}

class AnalysisInitial extends AnalysisState {}

class AnalysisLoading extends AnalysisState {}

class AnalysisSuccess extends AnalysisState {
  final List<AnalysisModel> analyses;

  AnalysisSuccess(this.analyses);
}

class AnalysisEmpty extends AnalysisState {}

class AnalysisError extends AnalysisState {
  final String message;

  AnalysisError(this.message);
}
