abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  BookingSuccess();
}

class BookingError extends BookingState {
  final String message;

  BookingError({required this.message});
}
