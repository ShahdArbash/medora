import 'package:flutter/material.dart';
import 'package:medoraapp/features/booking/presentation/widgets/time_selector_widget.dart';
import '../../data/models/time_model.dart';

class TimeSection extends StatefulWidget {
  final String title;
  final List<TimeModel> times;
  final String? selectedTime;
  final Function(String) onSelect;

  const TimeSection({
    super.key,
    required this.title,
    required this.times,
    required this.selectedTime,
    required this.onSelect,
  });

  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final visibleTimes = expanded
        ? widget.times
        : widget.times.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        InkWell(
          onTap: () => setState(() => expanded = !expanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// GRID (3 per row)
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleTimes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.4,
          ),
          itemBuilder: (context, index) {
            final time = visibleTimes[index];

            return TimeSlot(
              time: time.time,
              isSelected: widget.selectedTime == time.time,
              isDisabled: !time.isAvailable,
              onTap: () => widget.onSelect(time.time),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
