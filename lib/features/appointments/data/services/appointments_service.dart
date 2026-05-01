// TODO: Add appointments service implementation
import 'package:medoraapp/core/network/api_client.dart';
import 'package:medoraapp/features/appointments/data/models/appointment_model.dart';

class AppointmentsService {
  final ApiClient apiClient = ApiClient();

  static const bool useMock = true;

  Future<List<AppointmentModel>> fetchAppointments() async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 700));

      return mockAppointments.map((e) => AppointmentModel.fromJson(e)).toList();
    }

    final response = await apiClient.dio.get("appointments");

    return (response.data as List)
        .map((e) => AppointmentModel.fromJson(e))
        .toList();
  }
}

final List<Map<String, dynamic>> mockAppointments = [
  {
    "title": "تحليل دم شامل",
    "lab_name": "مخبر ألفا",
    "address": "المزة",
    "date": "2026-05-01",
    "time": "10:00:00",
    "status": "pending",
  },
  {
    "title": "تحليل فيتامين D",
    "lab_name": "مخبر الشفاء",
    "address": "المالكي",
    "date": "2026-04-20",
    "time": "09:00:00",
    "status": "completed",
  },
  {
    "title": "فحص سكر الدم",
    "lab_name": "مخبر الحياة",
    "address": "أبو رمانة",
    "date": "2026-05-03",
    "time": "08:30:00",
    "status": "pending",
  },
  {
    "title": "تحليل دهون",
    "lab_name": "مخبر الشفاء",
    "address": "المهاجرين",
    "date": "2026-04-18",
    "time": "11:15:00",
    "status": "completed",
  },
  {
    "title": "فحص دم شامل",
    "lab_name": "مخبر ألفا",
    "address": "البرامكة",
    "date": "2026-05-10",
    "time": "12:00:00",
    "status": "pending",
  },
];
