import 'package:medoraapp/features/appointments/data/models/appointment_model.dart';

enum AppointmentFilter { upcoming, previous }

abstract class AppointmentsState {}

class AppointmentsInitial extends AppointmentsState {}

class AppointmentsLoading extends AppointmentsState {}

class AppointmentsLoaded extends AppointmentsState {
  final List<AppointmentModel> appointments;
  final AppointmentFilter filter;

  AppointmentsLoaded(this.appointments, this.filter);
}

class AppointmentsEmpty extends AppointmentsState {}

class AppointmentsError extends AppointmentsState {
  final String message;
  AppointmentsError(this.message);
}
