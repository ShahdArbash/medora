import 'package:medoraapp/features/booking/data/models/View%20Model/test_model.dart';

class BookingContext {
  final int labId;
  final List<int> testIds;
  final List<TestModel> tests;

  final String labName;
  final String? location;
  final String? duration;

  BookingContext({
    required this.labId,
    required this.testIds,
    required this.tests,
    required this.labName,
    this.location,
    this.duration,
  });
}
