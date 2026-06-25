import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({super.key, required this.name, required this.title});

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: CairoFonts.regular(fontSize: 12)),
        Spacer(),
        Text(
          name,
          style: CairoFonts.regular(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
