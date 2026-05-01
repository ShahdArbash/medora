import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';

class AppointmentActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const AppointmentActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor.withValues(alpha: 0.15),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        child: Text(
          "عرض التفاصيل",
          style: CairoFonts.bold(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
