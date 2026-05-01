import 'package:medoraapp/features/booking/data/models/booking_request.dart';

class BookingApiRequest {
  final int labId;
  final int analysisId;
  final String date;
  final String time;

  BookingApiRequest({
    required this.labId,
    required this.analysisId,
    required this.date,
    required this.time,
  });

  factory BookingApiRequest.fromRequest(BookingRequest request) {
    if (request.date == null || request.time == null) {
      throw Exception("BookingRequest incomplete");
    }

    return BookingApiRequest(
      labId: request.labId,
      analysisId: request.analysisId,
      date: request.date!,
      time: request.time!,
    );
  }

  Map<String, dynamic> toJson() => {
    "lab_id": labId,
    "analysis_id": analysisId,
    "date": date,
    "time": time,
  };
}
