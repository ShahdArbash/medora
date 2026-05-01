import 'package:flutter/material.dart';
import 'package:medoraapp/features/booking/presentation/widgets/booking_info_item.dart';

class BookingDetailsCard extends StatelessWidget {
  final List items;

  const BookingDetailsCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD8DBEC)),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];

          return Column(
            children: [
              BookingInfoItem(
                label: item.label,
                value: item.value,
                icon: item.icon,
              ),

              /// divider
              if (index != items.length - 1)
                const Divider(color: Color(0xFFD8DBEC)),
            ],
          );
        }),
      ),
    );
  }
}
