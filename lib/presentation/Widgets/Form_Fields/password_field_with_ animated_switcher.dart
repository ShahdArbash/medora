import 'package:flutter/material.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/base_password_field.dart';
import 'password_rules_indicator.dart';

class PasswordFieldWithRules extends StatefulWidget {
  const PasswordFieldWithRules({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  State<PasswordFieldWithRules> createState() => _PasswordFieldWithRulesState();
}

class _PasswordFieldWithRulesState extends State<PasswordFieldWithRules> {
  final ValueNotifier<String> _password = ValueNotifier('');
  final FocusNode _focusNode = FocusNode();

  bool _showRules = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _showRules = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _password.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasePasswordField(
          controller: widget.controller,
          focusNode: _focusNode,

          validator: widget.validator,
          onChanged: (value) => _password.value = value,

          hintText: AppLocalizations.of(context)!.password,
        ),

        const SizedBox(height: 8),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _showRules
              ? PasswordRulesIndicator(password: _password)
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
