import 'booking_info_model.dart';
import 'package:flutter/material.dart';

extension BookingRequestUI on BookingRequest {
  List<BookingInfoModel> toInfoList() {
    return [
      BookingInfoModel(
        label: "نوع التحليل",
        value: analysisName,
        icon: Icons.science,
      ),
      BookingInfoModel(
        label: "المخبر",
        value: labName,
        icon: Icons.local_hospital,
      ),
      BookingInfoModel(
        label: "التاريخ",
        value: date ?? "-",
        icon: Icons.calendar_today,
      ),
      BookingInfoModel(
        label: "الوقت",
        value: time ?? "-",
        icon: Icons.access_time,
      ),
      BookingInfoModel(
        label: "السعر",
        value: "$price ل.س",
        icon: Icons.attach_money,
      ),
      BookingInfoModel(
        label: "الموقع",
        value: location ?? "-",
        icon: Icons.location_on,
      ),
      BookingInfoModel(
        label: "مدة التسليم",
        value: duration ?? "-",
        icon: Icons.timer,
      ),
    ];
  }
}

class BookingRequest {
  final int labId;
  final int analysisId;
  final String analysisName;
  final String labName;
  final double price;

  final String? location;
  final String? duration;

  final String? date;
  final String? time;

  BookingRequest({
    required this.labId,
    required this.analysisId,
    required this.analysisName,
    required this.labName,
    required this.price,

    this.date,
    this.time,
    this.location,
    this.duration,
  });
  BookingRequest copyWith({
    String? date,
    String? time,
    bool clearTime = false,
    String? location,
    String? duration,
  }) {
    return BookingRequest(
      labId: labId,
      analysisId: analysisId,
      analysisName: analysisName,
      labName: labName,
      price: price,
      location: location ?? this.location,
      duration: duration ?? this.duration,
      date: date ?? this.date,
      time: clearTime ? null : (time ?? this.time),
    );
  }
}
