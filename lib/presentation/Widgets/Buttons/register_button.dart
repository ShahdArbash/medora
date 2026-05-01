import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/features/auth/presentation/views/register_scope_view.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import 'package:medoraapp/features/auth/presentation/views/register_view.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      hasBorder: true,
      borderColor: AppColors.fieldBackgroundColor,
      label: AppLocalizations.of(context)!.register, // "إنشاء حساب"
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RegisterScopeView(child: const RegisterView()),
          ),
        );
      },
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 18,
    );
  }
}
