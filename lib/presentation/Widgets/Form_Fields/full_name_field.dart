import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/build_text_form_field.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      controller: controller,
      validator: validator,

      hintText: AppLocalizations.of(context)!.fullName,
      icon: Icons.person_2_outlined,
    );
  }
}
