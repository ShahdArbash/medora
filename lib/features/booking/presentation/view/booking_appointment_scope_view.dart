import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/booking/data/models/View Model/booking_context.dart';
import 'package:medoraapp/features/booking/data/service/booking_service.dart';
import 'package:medoraapp/features/booking/data/repository/booking_repository.dart';
import 'package:medoraapp/features/booking/logic/booking_cubit/booking_cubit.dart';
import 'package:medoraapp/features/booking/logic/slots_cubit/slots_cubit.dart';
import 'book_appointment_view.dart';

class BookingScopeView extends StatelessWidget {
  final BookingContext bookingData;

  const BookingScopeView({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    final repository = BookingRepository(context.read<BookingService>());

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SlotsCubit(repository, bookingData.labId)),
        BlocProvider(create: (_) => BookingCubit(repository)),
      ],
      child: BookAppointmentView(bookingData: bookingData),
    );
  }
}
