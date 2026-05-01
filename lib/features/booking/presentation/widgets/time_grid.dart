import 'package:flutter/material.dart';
import 'package:medoraapp/features/booking/data/models/time_model.dart';
import 'package:medoraapp/features/booking/presentation/utils/time_utils.dart';
import 'package:medoraapp/features/booking/presentation/widgets/time_section.dart';

class TimeGrid extends StatelessWidget {
  final List<TimeModel> times;
  final String? selectedTime;
  final Function(String) onSelect;

  const TimeGrid({
    super.key,
    required this.times,
    required this.selectedTime,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final grouped = groupTimes(times);

    return Column(
      children: grouped.entries.map((entry) {
        if (entry.value.isEmpty) return const SizedBox();

        return TimeSection(
          title: getPeriodLabel(entry.key),
          times: entry.value,
          selectedTime: selectedTime,
          onSelect: onSelect,
        );
      }).toList(),
    );
  }
}
