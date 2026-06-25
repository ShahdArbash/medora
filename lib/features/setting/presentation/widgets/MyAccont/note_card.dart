import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.goldColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(color: AppColors.onGoldColor)),
    );
  }
}
