class AppointmentModel {
  final String title;
  final String labName;
  final String address;
  final String date;
  final String time;
  final String status;

  AppointmentModel({
    required this.title,
    required this.labName,
    required this.address,
    required this.date,
    required this.time,
    required this.status,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      title: json['title'] ?? '',
      labName: json['lab_name'] ?? '',
      address: json['address'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? '',
    );
  }

  //  نحول التاريخ والوقت لـ DateTime
  DateTime get dateTime {
    return DateTime.parse("$date $time");
  }

  //  هل الموعد مستقبلي؟
  bool get isUpcoming => dateTime.isAfter(DateTime.now());

  //  هل انتهى؟
  bool get isPast => !isUpcoming;
}
