import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/tab_item.dart';

class AppointmentsTabs extends StatelessWidget {
  final AppointmentFilter selected;
  final Function(AppointmentFilter) onChanged;

  const AppointmentsTabs({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isUpcoming = selected == AppointmentFilter.upcoming;

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: isUpcoming
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  TabItem(
                    title: "مواعيدي القادمة",
                    isSelected: isUpcoming,
                    onTap: () => onChanged(AppointmentFilter.upcoming),
                  ),
                  TabItem(
                    title: "مواعيدي السابقة",
                    isSelected: !isUpcoming,
                    onTap: () => onChanged(AppointmentFilter.previous),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
