class LabPivot {
  final double price;
  final int estimatedTime;

  LabPivot({required this.price, required this.estimatedTime});

  factory LabPivot.fromJson(Map<String, dynamic> json) {
    return LabPivot(
      price: double.parse(json['price']),
      estimatedTime: json['estimated_time_hours'],
    );
  }
}
