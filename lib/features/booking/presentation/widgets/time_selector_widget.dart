import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class TimeSlot extends StatelessWidget {
  final String time;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onTap;

  const TimeSlot({
    super.key,
    required this.time,
    required this.isSelected,
    this.isDisabled = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : const Color(0x2B00A4A6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDisabled
                ? Colors.grey
                : isSelected
                ? AppColors.primaryColor
                : AppColors.borderColor.withValues(alpha: 0.3),
          ),
        ),

        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              time,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDisabled
                    ? Colors.grey
                    : isSelected
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
