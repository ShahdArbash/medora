import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_cubit.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_card.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_skeleton.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/empty_widget.dart';

class AppointmentsList extends StatefulWidget {
  final AppointmentFilter type;

  const AppointmentsList({super.key, required this.type});

  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        if (state is AppointmentsLoading) {
          return const AppointmentSkeleton();
        }

        if (state is AppointmentsLoaded && state.filter == widget.type) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.appointments.length,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppointmentCard(
                  appointment: state.appointments[i],
                  onDetails: () {},
                ),
              );
            },
          );
        }

        return const EmptyWidget();
      },
    );
  }
}
