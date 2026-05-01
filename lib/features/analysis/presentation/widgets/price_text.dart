import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';

class PriceText extends StatelessWidget {
  final double price;
  final double? oldPrice;

  const PriceText({super.key, required this.price, this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (oldPrice != null)
          Text(
            "$oldPrice",
            style: CairoFonts.semiBold(
              fontSize: 12,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),

        const SizedBox(width: 6),

        Text(
          "$price ل.س",
          style: CairoFonts.bold(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
