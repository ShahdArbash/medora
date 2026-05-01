import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class BookingSuccessDialog extends StatefulWidget {
  final String labName;
  final VoidCallback onGoHome;
  const BookingSuccessDialog({
    super.key,
    required this.labName,
    required this.onGoHome,
  });

  @override
  State<BookingSuccessDialog> createState() => _BookingSuccessDialogState();
}

class _BookingSuccessDialogState extends State<BookingSuccessDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _responsiveWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 600) return 400; // tablets
    if (width > 400) return width * 0.75; // phones large
    return width * 0.85; // small phones
  }

  @override
  Widget build(BuildContext context) {
    final size = _responsiveWidth(context);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: Container(
              width: size,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF008C91),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 64),
                  const SizedBox(height: 12),
                  Text(
                    "تم تأكيد حجز موعدك في ${widget.labName}",
                    style: CairoFonts.semiBold(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "شكراً لاختياركم ${widget.labName}\nنتمنى لكم دوام الصحة والعافية",
                    style: CairoFonts.regular(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onGoHome();
                    },
                    child: const Text(
                      "العودة للرئيسية",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
