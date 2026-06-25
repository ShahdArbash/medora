import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final IconData? icon;
  const HeaderTitle({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: CairoFonts.bold(fontSize: 14)),
        Spacer(),
        if (icon != null) Icon(icon),
      ],
    );
  }
}
