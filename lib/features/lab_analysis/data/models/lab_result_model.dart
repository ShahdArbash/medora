class LabResultModel {
  final String testName;
  final double value;
  final double minRange;
  final double maxRange;
  final String unit;
  final String status;

  LabResultModel({
    required this.testName,
    required this.value,
    required this.minRange,
    required this.maxRange,
    required this.unit,
    required this.status,
  });
}
