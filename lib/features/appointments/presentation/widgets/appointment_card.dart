import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_action_button.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_header.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_info_row.dart';
import '../../data/models/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  final VoidCallback onDetails;

  const AppointmentCard({
    super.key,
    required this.appointment,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Container(
          width: width,
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                offset: Offset(0, 4),
                color: Colors.black12,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppointmentHeader(appointment: appointment),

              const SizedBox(height: 12),

              AppointmentInfoRow(
                icon: Icons.science,
                text: appointment.labName,
                isPrimary: true,
              ),

              const SizedBox(height: 6),

              AppointmentInfoRow(
                icon: Icons.location_on,
                text: appointment.address,
              ),

              const Divider(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appointment.time, style: CairoFonts.regular()),
                  Text(appointment.date, style: CairoFonts.regular()),
                ],
              ),

              const SizedBox(height: 12),

              AppointmentActionButton(onTap: onDetails),
            ],
          ),
        );
      },
    );
  }
}
