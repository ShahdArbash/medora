import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class AppointmentStatusBadge extends StatelessWidget {
  final String text;
  final Color color;

  const AppointmentStatusBadge({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: CairoFonts.bold(color: color, fontSize: 12)),
    );
  }
}
