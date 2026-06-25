class TimeModel {
  final String time;
  final bool isAvailable;
  final int remainingSlots;

  TimeModel({
    required this.time,
    required this.isAvailable,
    required this.remainingSlots,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      time: json['time'],
      isAvailable: json['is_available'],
      remainingSlots: json['remaining_slots'],
    );
  }
}
