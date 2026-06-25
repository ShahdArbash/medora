import 'package:flutter/material.dart';

class BookingInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const BookingInfoItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final iconSize = size.width * 0.11;
    final spacing = size.width * 0.03;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.005),

          /// ICON
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: const Color(0x2B00A4A6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.teal, size: iconSize * 0.55),
          ),

          SizedBox(width: spacing),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.6),
                    fontSize: size.width * 0.035,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  value,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.008),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
