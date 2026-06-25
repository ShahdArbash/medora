import 'package:dio/dio.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/booking/data/models/Request%20Model/booking_api_request.dart';
import 'package:medoraapp/features/booking/data/models/Request%20Model/booking_request.dart';
import 'package:medoraapp/features/booking/data/models/View%20Model/time_model.dart';
import 'package:medoraapp/features/booking/data/service/booking_service.dart';

class BookingRepository {
  final BookingService service;

  BookingRepository(this.service);

  Future<List<TimeModel>> getTimes({required int labId, required String date}) {
    return service.fetchTimes(labId: labId, date: date);
  }

  Future<void> bookAppointment(BookingRequest request) async {
    try {
      final apiRequest = BookingApiRequest.fromRequest(request);
      await service.bookAppointment(apiRequest);
    } on DioException catch (e) {
      throw ApiException.fromResponse(e.response?.statusCode, e.response?.data);
    }
  }
}
