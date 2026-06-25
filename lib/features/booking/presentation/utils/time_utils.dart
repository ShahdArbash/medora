import '../../data/models/View Model/time_model.dart';

Map<String, List<TimeModel>> groupTimes(List<TimeModel> times) {
  final Map<String, List<TimeModel>> groups = {
    "morning": [],
    "afternoon": [],
    "evening": [],
  };

  for (var t in times) {
    final hour = int.parse(t.time.split(":")[0]);

    if (hour < 12) {
      groups["morning"]!.add(t);
    } else if (hour < 17) {
      groups["afternoon"]!.add(t);
    } else {
      groups["evening"]!.add(t);
    }
  }

  return groups;
}

String getPeriodLabel(String key) {
  switch (key) {
    case "morning":
      return "فترة الصباح";
    case "afternoon":
      return "فترة الظهيرة";
    case "evening":
      return "فترة المساء";
    default:
      return "";
  }
}
