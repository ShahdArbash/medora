import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_custom_app_bar.dart';
import 'package:medoraapp/features/booking/data/models/Request Model/booking_request.dart';
import 'package:medoraapp/features/booking/data/models/View Model/booking_context.dart';
import 'package:medoraapp/features/booking/logic/booking_cubit/booking_cubit.dart';
import 'package:medoraapp/features/booking/logic/booking_cubit/booking_state.dart';
import 'package:medoraapp/features/booking/presentation/utils/build_booking_details.dart';
import 'package:medoraapp/features/booking/presentation/widgets/Details/booking_details_card.dart';
import 'package:medoraapp/features/booking/presentation/widgets/booking_result_dialog.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import 'package:medoraapp/presentation/views/home_view.dart';

class BookingDetailsView extends StatelessWidget {
  final BookingContext contextData;
  final String date;
  final String time;

  const BookingDetailsView({
    super.key,
    required this.contextData,
    required this.date,
    required this.time,
  });

  void _goHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeView()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = buildBookingDetails(contextData, date, time);

    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) async {
        if (state is BookingSuccess) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => BookingResultDialog.success(
              labName: contextData.labName,
              onGoHome: () {
                Navigator.of(context).pop(); // close dialog first
                _goHome(context);
              },
            ),
          );
        }
        if (state is BookingError) {
          await showDialog(
            context: context,
            builder: (_) => BookingResultDialog.error(
              message: state.message,
              onRetry: () {
                Navigator.of(context).pop(true);
              },
            ),
          );
        }
      },
      child: Scaffold(
        appBar: const AppCustomAppBar(title: 'تفاصيل الحجز'),

        body: Column(
          children: [
            Expanded(child: BookingDetailsCard(items: items)),

            Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<BookingCubit, BookingState>(
                builder: (context, state) {
                  final loading = state is BookingLoading;

                  return GenericButton(
                    label: loading ? "جاري الحجز..." : "تأكيد الحجز",
                    onPressed: loading
                        ? null
                        : () {
                            final request = BookingRequest(
                              labId: contextData.labId,
                              testIds: contextData.testIds,
                              date: date,
                              time: time,
                            );
                            context.read<BookingCubit>().submit(request);
                          },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
