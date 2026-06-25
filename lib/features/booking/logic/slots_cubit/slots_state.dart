import 'package:medoraapp/features/booking/data/models/View%20Model/time_model.dart';

abstract class SlotsState {}

class SlotsInitial extends SlotsState {}

class SlotsLoading extends SlotsState {}

class SlotsLoaded extends SlotsState {
  final List<TimeModel> times;
  final String date;
  final String? selectedTime;

  SlotsLoaded({required this.times, required this.date, this.selectedTime});

  SlotsLoaded copyWith({
    List<TimeModel>? times,
    String? date,
    String? selectedTime,
  }) {
    return SlotsLoaded(
      times: times ?? this.times,
      date: date ?? this.date,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}

class SlotsEmpty extends SlotsState {}

class SlotsError extends SlotsState {
  final String message;

  SlotsError(this.message);
}
