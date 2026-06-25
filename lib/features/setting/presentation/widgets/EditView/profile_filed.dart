import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/build_text_form_field.dart';

class ProfileFiled extends StatelessWidget {
  const ProfileFiled({
    super.key,

    required this.text,
    required this.icon,
    required this.controller,
  });

  final String text;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: CairoFonts.semiBold(fontSize: 12)),
        SizedBox(height: 8),
        BuildTextFormField(
          icon: icon,
          showValidationState: false,
          controller: controller,
        ),
      ],
    );
  }
}
