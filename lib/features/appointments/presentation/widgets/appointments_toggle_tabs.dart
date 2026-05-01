import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/tab_item.dart';

class AppointmentsToggleTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const AppointmentsToggleTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.backgroundtextfildeChatColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          TabItem(
            title: "مواعيدي السابقة",
            isSelected: selectedIndex == 0,
            onTap: () => onChanged(0),
          ),
          const SizedBox(width: 10),
          TabItem(
            title: "مواعيدي القادمة",
            isSelected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
        ],
      ),
    );
  }
}
