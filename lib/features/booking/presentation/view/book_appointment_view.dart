import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_custom_app_bar.dart';
import 'package:medoraapp/features/booking/data/models/View%20Model/booking_context.dart';
import 'package:medoraapp/features/booking/logic/booking_cubit/booking_cubit.dart';
import 'package:medoraapp/features/booking/logic/slots_cubit/slots_cubit.dart';
import 'package:medoraapp/features/booking/logic/slots_cubit/slots_state.dart';
import 'package:medoraapp/features/booking/presentation/view/booking_details_view.dart';
import 'package:medoraapp/features/booking/presentation/widgets/Appointment/date_picker_widget.dart';
import 'package:medoraapp/features/booking/presentation/widgets/time_grid.dart';
import 'package:medoraapp/features/booking/presentation/widgets/Appointment/time_grid_skeleton.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class BookAppointmentView extends StatelessWidget {
  final BookingContext bookingData;

  const BookAppointmentView({super.key, required this.bookingData});
  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picked == null) return;

    final formatted = picked.toIso8601String().split("T").first;

    context.read<SlotsCubit>().loadSlots(formatted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(title: 'اختيار الموعد'),

      body: Column(
        children: [
          const Divider(),

          Expanded(
            child: BlocBuilder<SlotsCubit, SlotsState>(
              builder: (context, state) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                  children: [
                    Text("اختر تاريخ لعرض الأوقات", style: CairoFonts.bold()),

                    const SizedBox(height: 16),

                    DatePickerField(
                      date: state is SlotsLoaded ? state.date : null,
                      onTap: () => pickDate(context),
                    ),

                    const SizedBox(height: 24),

                    _buildSlotsSection(context, state),
                  ],
                );
              },
            ),
          ),

          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildSlotsSection(BuildContext context, SlotsState state) {
    final cubit = context.read<SlotsCubit>();

    if (state is SlotsInitial) {
      return const SizedBox();
    }

    if (state is SlotsLoading) {
      return const TimeGridSkeleton();
    }

    if (state is SlotsEmpty) {
      return const Center(child: Text("لا توجد أوقات متاحة"));
    }

    if (state is SlotsLoaded) {
      return TimeGrid(
        times: state.times,
        selectedTime: state.selectedTime,
        onSelect: cubit.selectTime,
      );
    }

    if (state is SlotsError) {
      return Center(child: Text(state.message));
    }

    return const SizedBox();
  }

  Widget _buildBottomButton(BuildContext context) {
    return BlocSelector<SlotsCubit, SlotsState, SlotsLoaded?>(
      selector: (state) => state is SlotsLoaded ? state : null,
      builder: (context, state) {
        final enabled = state?.selectedTime != null;

        return Padding(
          padding: const EdgeInsets.all(8),
          child: GenericButton(
            label: "متابعة",
            onPressed: enabled
                ? () async {
                    final cubit = context.read<SlotsCubit>();

                    final shouldRefresh = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<BookingCubit>(),
                          child: BookingDetailsView(
                            date: state!.date,
                            time: state.selectedTime!,
                            contextData: bookingData,
                          ),
                        ),
                      ),
                    );

                    if (shouldRefresh == true) {
                      cubit.loadSlots(state!.date);
                    }
                  }
                : null,
          ),
        );
      },
    );
  }
}
