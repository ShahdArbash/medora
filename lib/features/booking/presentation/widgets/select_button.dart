import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const SelectButton({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00AFB4) : const Color(0x2B00A4A6),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          isSelected ? "تم الاختيار" : "اختيار",
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
