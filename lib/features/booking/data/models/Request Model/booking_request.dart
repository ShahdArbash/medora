class BookingRequest {
  final int labId;
  final List<int> testIds;
  final String date;
  final String time;

  BookingRequest({
    required this.labId,
    required this.testIds,
    required this.date,
    required this.time,
  });

  String get formattedTime {
    if (time.split(":").length == 2) {
      return "$time:00";
    }
    return time;
  }
}
