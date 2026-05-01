import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_cubit.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointments_tabs.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      AppointmentsCubit,
      AppointmentsState,
      AppointmentFilter
    >(
      selector: (state) {
        if (state is AppointmentsLoaded) return state.filter;
        return AppointmentFilter.upcoming;
      },
      builder: (context, selected) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SizedBox(
            height: 56,
            child: AppointmentsTabs(
              selected: selected,
              onChanged: (f) {
                context.read<AppointmentsCubit>().changeTab(f);
              },
            ),
          ),
        );
      },
    );
  }
}
