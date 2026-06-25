import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class GenericButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;

  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double height;
  final double borderRadius;
  final bool isLoading;
  final bool hasBorder;
  final Color borderColor;
  final bool hasShadow;

  const GenericButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.height = 46,
    this.borderRadius = 12,
    this.isLoading = false,
    this.hasBorder = false,
    this.borderColor = Colors.grey,
    this.hasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = !isEnabled || onPressed == null;

    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: AbsorbPointer(
        absorbing: disabled || isLoading,
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              shadowColor: hasShadow
                  ? Colors.black.withValues(alpha: 0.2)
                  : Colors.transparent,
              backgroundColor: disabled
                  ? backgroundColor.withValues(alpha: 0.5)
                  : backgroundColor,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),

                side: hasBorder
                    ? BorderSide(color: borderColor, width: 1)
                    : BorderSide.none,
              ),
            ),
            child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: textColor,
                    ),
                  )
                : Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
