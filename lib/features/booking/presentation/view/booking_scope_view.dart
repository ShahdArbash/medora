import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/booking/data/models/booking_request.dart';
import 'package:medoraapp/features/booking/data/repository/booking_repository.dart';
import 'package:medoraapp/features/booking/data/service/booking_service.dart';
import 'package:medoraapp/features/booking/logic/booking_cubit/booking_cubit.dart';
import 'package:medoraapp/features/booking/presentation/view/book_appointment_view.dart';

class BookingScopeView extends StatelessWidget {
  final BookingRequest bookingData;

  const BookingScopeView({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    final request = BookingRequest(
      labId: bookingData.labId,
      analysisId: bookingData.analysisId,
      analysisName: bookingData.analysisName,
      labName: bookingData.labName,
      price: bookingData.price,
      location: bookingData.location,
      duration: bookingData.duration,
    );

    return RepositoryProvider(
      create: (_) => BookingService(),
      child: BlocProvider(
        create: (context) => BookingCubit(
          BookingRepository(context.read<BookingService>()),
          request,
        ),
        child: BookAppointmentView(),
      ),
    );
  }
}
