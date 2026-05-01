import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/widgets/app_custom_app_bar.dart';
import 'package:medoraapp/features/booking/data/models/booking_request.dart';
import 'package:medoraapp/features/booking/presentation/widgets/booking_details_card.dart';
import 'package:medoraapp/features/booking/presentation/widgets/booking_success_dialog.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import 'package:medoraapp/presentation/views/home_view.dart';

class BookingDetailsView extends StatelessWidget {
  final BookingRequest request;

  BookingDetailsView({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final items = request.toInfoList();
    return Scaffold(
      appBar: AppCustomAppBar(title: 'تفاصيل الحجز'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: BookingDetailsCard(items: request.toInfoList()),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: GenericButton(
              label: "تأكيد الحجز",
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return BookingSuccessDialog(
                      labName: request.labName,
                      onGoHome: () {
                        Navigator.pop(context);

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const HomeView()),
                          (route) => false,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
