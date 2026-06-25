import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class BookingResultDialog extends StatelessWidget {
  final String? message;
  final bool isSuccess;
  final String labName;
  final VoidCallback? onGoHome;
  final VoidCallback? onRetry;

  const BookingResultDialog.success({
    super.key,
    required this.labName,
    required this.onGoHome,
  }) : isSuccess = true,
       message = null,
       onRetry = null;

  const BookingResultDialog.error({super.key, this.onRetry, this.message})
    : isSuccess = false,
      labName = "",
      onGoHome = null;
  @override
  Widget build(BuildContext context) {
    final color = isSuccess ? const Color(0xFF008C91) : Colors.red;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: Colors.white,
              size: 64,
            ),
            const SizedBox(height: 12),

            /// TITLE
            Text(
              isSuccess ? "تم تأكيد حجز موعدك في $labName" : ("لم يتم الحجز"),
              style: CairoFonts.semiBold(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            /// SUBTEXT
            Text(
              isSuccess
                  ? "شكراً لاختياركم $labName\nنتمنى لكم دوام الصحة والعافية"
                  : (message ?? "يرجى اختيار وقت آخر"),
              style: CairoFonts.regular(color: Colors.white70),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog

                if (isSuccess) {
                  onGoHome?.call();
                } else {
                  onRetry?.call();
                }
              },
              child: Text(
                isSuccess ? "العودة للرئيسية" : "حجز موعد آخر",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
