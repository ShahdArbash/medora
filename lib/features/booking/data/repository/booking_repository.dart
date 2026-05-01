import 'package:medoraapp/features/booking/data/models/booking_request.dart';
import 'package:medoraapp/features/booking/data/models/time_model.dart';
import 'package:medoraapp/features/booking/data/service/booking_service.dart';

class BookingRepository {
  final BookingService service;

  BookingRepository(this.service);

  Future<List<TimeModel>> getTimes({required int labId, required String date}) {
    return service.fetchTimes(labId: labId, date: date);
  }

  Future<void> bookAppointment(BookingRequest request) {
    return service.bookAppointment(
      labId: request.labId,
      analysisId: request.analysisId,
      date: request.date!,
      time: request.time!,
    );
  }
}
