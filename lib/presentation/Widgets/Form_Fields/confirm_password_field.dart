import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/base_password_field.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.passwordController,
    required this.validator,
  });

  final TextEditingController controller;
  final TextEditingController passwordController;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return BasePasswordField(
      icon: Icons.lock_outline,
      controller: controller,

      validator: validator,

      hintText: AppLocalizations.of(context)!.confirmPassword,
    );
  }
}
