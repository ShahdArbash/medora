import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_custom_app_bar.dart';
import 'package:medoraapp/features/booking/logic/booking_cubit/booking_cubit.dart';
import 'package:medoraapp/features/booking/logic/booking_cubit/booking_state.dart';
import 'package:medoraapp/features/booking/presentation/widgets/date_picker_widget.dart';
import 'package:medoraapp/features/booking/presentation/widgets/time_grid.dart';
import 'package:medoraapp/features/booking/presentation/view/booking_details_view.dart';
import 'package:medoraapp/features/booking/presentation/widgets/time_grid_skeleton.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      final formatted =
          "${picked.year.toString().padLeft(4, '0')}-"
          "${picked.month.toString().padLeft(2, '0')}-"
          "${picked.day.toString().padLeft(2, '0')}";

      context.read<BookingCubit>().loadTimes(date: formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(title: 'اختيار الموعد'),

      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          final request = state.request;

          return Column(
            children: [
              Divider(),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                  children: [
                    /// التاريخ
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "اختر تاريخ لعرض الأوقات",
                        style: CairoFonts.bold(),
                      ),
                    ),
                    SizedBox(height: 16),
                    DatePickerField(
                      date: request.date,
                      onTap: () => pickDate(context),
                    ),

                    const SizedBox(height: 24),

                    if (state.status == BookingStatus.initial)
                      const SizedBox()
                    else if (state.status == BookingStatus.loading)
                      const TimeGridSkeleton()
                    else if (state.times.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text("لا توجد أوقات متاحة لهذا اليوم"),
                        ),
                      )
                    else
                      TimeGrid(
                        times: state.times,
                        selectedTime: request.time,
                        onSelect: (time) {
                          context.read<BookingCubit>().selectTime(time);
                        },
                      ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GenericButton(
                  label: "متابعة",
                  onPressed: (request.date != null && request.time != null)
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  BookingDetailsView(request: request),
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
