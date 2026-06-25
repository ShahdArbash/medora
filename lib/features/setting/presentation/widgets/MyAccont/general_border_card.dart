import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class GeneralBorderCard extends StatelessWidget {
  const GeneralBorderCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.borderColor.withValues(alpha: 0.1),
          ),
        ),
        child: child,
      ),
    );
  }
}
