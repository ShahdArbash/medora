import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';

class AppointmentInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isPrimary;

  const AppointmentInfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: isPrimary
              ? CairoFonts.bold(color: AppColors.primaryColor)
              : CairoFonts.regular(color: Colors.grey),
        ),
        const SizedBox(width: 6),
        Icon(icon, size: 18, color: Colors.grey),
      ],
    );
  }
}
