import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: CairoFonts.bold(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
