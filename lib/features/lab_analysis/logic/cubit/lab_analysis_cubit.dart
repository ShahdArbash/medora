import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lab_analysis_state.dart';

class LabAnalysisCubit extends Cubit<LabAnalysisState> {
  LabAnalysisCubit() : super(LabAnalysisInitial());
}
