import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_cubit.dart';
import 'package:medoraapp/features/appointments/logic/cubit/appointments_state.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/appointment_list.dart';
import 'package:medoraapp/features/appointments/presentation/widgets/tab_section.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentsCubit, AppointmentsState>(
      listenWhen: (prev, curr) => curr is AppointmentsLoaded,
      listener: (context, state) {
        if (state is AppointmentsLoaded) {
          final index = state.filter == AppointmentFilter.upcoming ? 0 : 1;

          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("سجل المواعيد"), centerTitle: true),
          body: Column(
            children: [
              const TabsSection(),
              Expanded(
                child: PageView(
                  controller: _pageController,

                  onPageChanged: (index) {
                    final cubit = context.read<AppointmentsCubit>();

                    if (index == 0) {
                      cubit.changeTab(AppointmentFilter.upcoming);
                    } else {
                      cubit.changeTab(AppointmentFilter.previous);
                    }
                  },

                  children: const [
                    AppointmentsList(type: AppointmentFilter.upcoming),
                    AppointmentsList(type: AppointmentFilter.previous),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
