import 'package:medoraapp/features/analysis/data/models/analysis_lab_model.dart';

abstract class AnalysisLabsState {}

class AnalysisLabsInitial extends AnalysisLabsState {}

class AnalysisLabsLoading extends AnalysisLabsState {}

class AnalysisLabsLoaded extends AnalysisLabsState {
  final List<AnalysisLabModel> labs;
  final int totalCount;
  final int filteredCount;

  AnalysisLabsLoaded(this.labs, this.totalCount, this.filteredCount);
}

class AnalysisLabsEmpty extends AnalysisLabsState {}

class AnalysisLabsError extends AnalysisLabsState {
  final String message;

  AnalysisLabsError(this.message);
}
