import 'package:medoraapp/features/appointments/data/models/appointment_model.dart';

class AppointmentsResponse {
  final List<AppointmentModel> upcoming;
  final List<AppointmentModel> past;

  AppointmentsResponse({required this.upcoming, required this.past});
  factory AppointmentsResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return AppointmentsResponse(
      upcoming: (data['upcoming'] as List? ?? [])
          .map((e) => AppointmentModel.fromJson(e))
          .toList(),
      past: (data['past'] as List? ?? [])
          .map((e) => AppointmentModel.fromJson(e))
          .toList(),
    );
  }
}
