import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/booking/data/models/Request Model/booking_request.dart';
import 'package:medoraapp/features/booking/data/repository/booking_repository.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository repo;

  BookingCubit(this.repo) : super(BookingInitial());

  bool _isSubmitting = false;
  Future<void> submit(BookingRequest request) async {
    if (_isSubmitting) return;

    _isSubmitting = true;
    emit(BookingLoading());

    try {
      await repo.bookAppointment(request);
      emit(BookingSuccess());
    } on ApiException catch (e) {
      emit(BookingError(message: e.userMessage));
    } catch (_) {
      emit(BookingError(message: "حدث خطأ غير متوقع"));
    } finally {
      _isSubmitting = false;
    }
  }
}
