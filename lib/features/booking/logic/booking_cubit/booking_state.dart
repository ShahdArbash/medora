import 'package:medoraapp/features/booking/data/models/booking_request.dart';
import 'package:medoraapp/features/booking/data/models/time_model.dart';

enum BookingStatus { initial, loading, success, error }

class BookingState {
  final List<TimeModel> times;
  final BookingRequest request;
  final bool isLoading;
  final String? error;
  final BookingStatus status;

  const BookingState({
    required this.times,
    required this.request,
    this.isLoading = false,
    this.error,
    this.status = BookingStatus.initial,
  });

  BookingState copyWith({
    List<TimeModel>? times,
    BookingRequest? request,
    bool? isLoading,
    String? error,
    BookingStatus? status,
  }) {
    return BookingState(
      times: times ?? this.times,
      request: request ?? this.request,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      status: status ?? this.status,
    );
  }
}
