import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/build_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.validator,
    this.focusNode,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      controller: controller,
      focusNode: focusNode,
      hintText: AppLocalizations.of(context)!.email,
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
    );
  }
}
