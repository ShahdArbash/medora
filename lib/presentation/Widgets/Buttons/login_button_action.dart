import 'package:flutter/material.dart';

import 'package:medoraapp/constants/colors.dart';

import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class LoginButtonAction extends StatelessWidget {
  const LoginButtonAction({
    super.key,
    required this.onSubmit,
    required this.isLoading,
  });

  final VoidCallback onSubmit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GenericButton(
      label: isLoading ? l10n.loading : l10n.login,
      onPressed: isLoading ? null : onSubmit,
      backgroundColor: Colors.white,
      textColor: AppColors.primaryColor,
      fontSize: 18,
    );
  }
}
