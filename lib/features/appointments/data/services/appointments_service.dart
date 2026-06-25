// TODO: Add appointments service implementation
import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/appointments/data/models/appointment_model.dart';

class AppointmentsService {
  final apiClient = ApiClient().dio;

  static const bool useMock = true;

  Future<List<AppointmentModel>> fetchAppointments() async {
    final response = await apiClient.get("appointments");

    return (response.data as List)
        .map((e) => AppointmentModel.fromJson(e))
        .toList();
  }
}
