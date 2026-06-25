import 'package:flutter/material.dart';
import 'package:medoraapp/features/booking/data/models/View Model/booking_context.dart';
import 'package:medoraapp/features/booking/data/models/View Model/booking_details_model.dart';

List<BookingDetailsModel> buildBookingDetails(
  BookingContext data,
  String? date,
  String? time,
) {
  final totalPrice = data.tests.fold<double>(
    0,
    (sum, item) => sum + item.price,
  );

  return [
    BookingDetailsModel(
      label: "التحاليل المختارة",
      value: data.tests.map((e) => e.name).join("، "),
      icon: Icons.science,
    ),
    BookingDetailsModel(
      label: "المخبر",
      value: data.labName,
      icon: Icons.local_hospital,
    ),

    BookingDetailsModel(
      label: "الموقع",
      value: data.location ?? "-",
      icon: Icons.location_on,
    ),
    BookingDetailsModel(
      label: "السعر الإجمالي",
      value: "$totalPrice ل.س",
      icon: Icons.attach_money,
    ),
    BookingDetailsModel(
      label: "مدة التسليم",
      value: data.duration ?? "-",
      icon: Icons.timer,
    ),

    BookingDetailsModel(
      label: "التاريخ",
      value: date ?? "-",
      icon: Icons.calendar_today,
    ),

    BookingDetailsModel(
      label: "الوقت",
      value: time ?? "-",
      icon: Icons.access_time,
    ),
  ];
}
