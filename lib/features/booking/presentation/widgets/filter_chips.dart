import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00AFB4) : const Color(0x2B00A4A6),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
