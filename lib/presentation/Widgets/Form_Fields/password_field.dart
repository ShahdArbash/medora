import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/core/validators/password_validator.dart';
import 'base_password_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return BasePasswordField(
      focusNode: focusNode,
      hintText: AppLocalizations.of(context)!.password,
      controller: controller,
      validator: (value) => passwordValidator(value, context),
      onChanged: onChanged,
    );
  }
}
