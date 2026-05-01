import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/booking/data/models/booking_request.dart';
import 'package:medoraapp/features/booking/data/repository/booking_repository.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository repo;

  BookingCubit(this.repo, BookingRequest initialRequest)
    : super(BookingState(times: [], request: initialRequest));
  Future<void> loadTimes({required String date}) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
        status: BookingStatus.loading,
        request: state.request.copyWith(date: date, time: null),
      ),
    );

    try {
      final times = await repo.getTimes(labId: state.request.labId, date: date);

      emit(
        state.copyWith(
          times: times,
          isLoading: false,
          status: BookingStatus.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: BookingStatus.error,
          error: "فشل تحميل الأوقات",
        ),
      );
    }
  }

  Future<void> submitBooking() async {
    emit(state.copyWith(status: BookingStatus.loading));

    try {
      await repo.bookAppointment(state.request);

      emit(state.copyWith(status: BookingStatus.success));
    } catch (e) {
      emit(state.copyWith(status: BookingStatus.error, error: "فشل الحجز"));
    }
  }

  void selectTime(String time) {
    emit(state.copyWith(request: state.request.copyWith(time: time)));
  }
}
