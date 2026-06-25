import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/booking/data/repository/booking_repository.dart';
import 'slots_state.dart';

class SlotsCubit extends Cubit<SlotsState> {
  final BookingRepository repo;
  final int labId;

  SlotsCubit(this.repo, this.labId) : super(SlotsInitial());

  bool _isLoading = false;

  Future<void> loadSlots(String date) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(SlotsLoading());

    try {
      final times = await repo.getTimes(labId: labId, date: date);

      if (times.isEmpty) {
        emit(SlotsEmpty());
      } else {
        emit(SlotsLoaded(times: times, date: date, selectedTime: null));
      }
    } catch (e) {
      emit(SlotsError(e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  void selectTime(String time) {
    final currentState = state;

    if (currentState is SlotsLoaded) {
      emit(currentState.copyWith(selectedTime: time));
    }
  }
}
