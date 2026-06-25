import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    required this.icon,
    this.obscurePassword = false,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.errorNotifier,
    this.onChanged,
    this.focusNode,
    this.showErrorNotifier,
    this.controller,
    this.showValidationState = true,
  });

  final String? labelText;
  final String? hintText;
  final IconData icon;
  final bool obscurePassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final ValueNotifier<String?>? errorNotifier;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final ValueNotifier<bool>? showErrorNotifier;
  final TextEditingController? controller;
  final bool showValidationState;

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    Widget buildTextField(String? error, bool showError) {
      final hasText = controller?.text.trim().isNotEmpty ?? false;

      final borderColor =
          showValidationState && error != null && error.isNotEmpty && showError
          ? Colors.red
          : showValidationState && hasText && error == null
          ? Colors.green
          : Colors.grey.shade300;

      final suffixIconWithState =
          showValidationState && error != null && error.isNotEmpty && showError
          ? const Icon(Icons.error, color: Colors.red)
          : showValidationState && hasText && error == null
          ? const Icon(Icons.check, color: Colors.green)
          : suffixIcon;

      return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        obscureText: obscurePassword,
        textAlign: TextAlign.start,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,

        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),

        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,

          labelStyle: const TextStyle(fontSize: 14),

          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),

          floatingLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),

          prefixIcon: isRTL ? null : Icon(icon),

          suffixIcon: isRTL
              ? (suffixIconWithState ?? Icon(icon))
              : suffixIconWithState,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderColor),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderColor, width: 1.5),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),

          filled: true,
          fillColor: Colors.grey.shade50,
        ),
      );
    }

    if (errorNotifier != null && showErrorNotifier != null) {
      return ValueListenableBuilder<String?>(
        valueListenable: errorNotifier!,
        builder: (context, error, _) {
          return ValueListenableBuilder<bool>(
            valueListenable: showErrorNotifier!,
            builder: (context, showError, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField(error, showError),

                  if (error != null &&
                      error.isNotEmpty &&
                      showError &&
                      showValidationState)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 12),
                      child: Text(
                        error,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              );
            },
          );
        },
      );
    }

    return buildTextField(null, false);
  }
}
