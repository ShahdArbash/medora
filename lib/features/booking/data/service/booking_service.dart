import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/booking/data/models/appointments_response.dart';
import 'package:medoraapp/features/booking/data/models/time_model.dart';

class BookingService {
  final _dio = ApiClient().dio;
  static const bool useMock = true;

  ///  جلب المواعيد (Upcoming / Past)
  Future<AppointmentsResponse> getAppointments() async {
    final response = await _dio.get("appointments");
    return AppointmentsResponse.fromJson(response.data);
  }

  Future<List<TimeModel>> fetchTimes({
    required int labId,
    required String date,
  }) async {
    final response = await _dio.get(
      "laboratories/$labId/slots",
      queryParameters: {"date": date},
    );

    final List data = response.data['data'];

    return data.map((e) => TimeModel.fromJson(e)).toList();
  }

  Future<void> bookAppointment({
    required int labId,
    required int analysisId,
    required String date,
    required String time,
  }) async {
    await _dio.post(
      "appointments",
      data: {
        "lab_id": labId,
        "analysis_id": analysisId,
        "date": date,
        "time": time,
      },
    );
  }
}
