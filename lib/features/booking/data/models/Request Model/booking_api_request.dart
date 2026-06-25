import 'package:medoraapp/features/booking/data/models/Request Model/booking_request.dart';

class BookingApiRequest {
  final int labId;
  final List<int> testIds;
  final String date;
  final String time;

  BookingApiRequest({
    required this.labId,
    required this.testIds,
    required this.date,
    required this.time,
  });

  factory BookingApiRequest.fromRequest(BookingRequest request) {
    return BookingApiRequest(
      labId: request.labId,
      testIds: request.testIds,
      date: request.date,
      time: request.formattedTime,
    );
  }

  Map<String, dynamic> toJson() => {
    "lab_id": labId,
    "appointment_date": date,
    "start_time": time,
    "test_ids": testIds,
  };
}
