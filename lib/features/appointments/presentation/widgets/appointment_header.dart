import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/appointments/data/models/appointment_model.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_status_badge.dart';

class AppointmentHeader extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentHeader({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor();

    return Row(
      children: [
        AppointmentStatusBadge(text: _statusText(), color: statusColor),

        const Spacer(),

        Expanded(
          child: Text(
            appointment.title,
            textAlign: TextAlign.right,
            style: CairoFonts.bold(fontSize: 16),
          ),
        ),
      ],
    );
  }

  String _statusText() {
    switch (appointment.status) {
      case "completed":
        return "مكتمل";
      case "pending":
        return "قيد الانتظار";
      case "cancelled":
        return "ملغي";
      default:
        return "غير معروف";
    }
  }

  Color _statusColor() {
    switch (appointment.status) {
      case "completed":
        return Colors.green;
      case "pending":
        return Colors.orange;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
