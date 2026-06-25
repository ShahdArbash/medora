import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/logic/cubit/AnalysisLabsCubit/analysis_labs_state.dart';

import '../../../data/service/analysis_labs_service.dart';

class AnalysisLabsCubit extends Cubit<AnalysisLabsState> {
  final AnalysisLabsService service;

  AnalysisLabsCubit(this.service) : super(AnalysisLabsInitial());

  Future<void> getLabs(int analysisId, {String sortBy = "price"}) async {
    if (isClosed) return;

    emit(AnalysisLabsLoading());

    try {
      final response = await service.fetchSortedLabs(analysisId, sortBy);

      if (response.labs.isEmpty) {
        emit(AnalysisLabsEmpty());
      } else {
        emit(
          AnalysisLabsLoaded(
            response.labs,
            response.totalCount,
            response.filteredCount,
          ),
        );
      }
    } catch (_) {
      emit(AnalysisLabsError("حدث خطأ"));
    }
  }
}
