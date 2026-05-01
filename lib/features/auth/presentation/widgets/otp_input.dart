import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medoraapp/constants/colors.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final Function(String)? onChanged;
  final bool hasError;
  final VoidCallback? onErrorAnimationEnd;

  const OtpInput({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.onChanged,
    this.hasError = false,
    this.onErrorAnimationEnd,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput>
    with SingleTickerProviderStateMixin {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(widget.length, (_) => TextEditingController());

    focusNodes = List.generate(widget.length, (_) => FocusNode());

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnimation = Tween<double>(
      begin: 0,
      end: 18,
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(_shakeController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes[0].requestFocus();
    });
  }

  @override
  void didUpdateWidget(covariant OtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.hasError && !oldWidget.hasError) {
      _triggerShake();
    }
  }

  void _triggerShake() async {
    await _shakeController.forward();
    await _shakeController.reverse();
    widget.onErrorAnimationEnd?.call();
  }

  //  SMART PASTE / AUTO-FILL HANDLER
  void _handleInput(String value, int index) {
    if (value.isEmpty) {
      return;
    }

    // إذا المستخدم لصق الكود كامل
    if (value.length > 1) {
      _fillOtp(value);
      return;
    }

    controllers[index].text = value;

    if (index < widget.length - 1) {
      focusNodes[index + 1].requestFocus();
    } else {
      FocusScope.of(context).unfocus();
    }

    _emitOtp();
  }

  void _fillOtp(String value) {
    final chars = value.split('');
    for (int i = 0; i < widget.length; i++) {
      if (i < chars.length) {
        controllers[i].text = chars[i];
      }
    }

    FocusScope.of(context).unfocus();
    _emitOtp();
  }

  void _emitOtp() {
    final otp = controllers.map((e) => e.text).join();

    widget.onChanged?.call(otp);

    if (otp.length == widget.length && !otp.contains('')) {
      widget.onCompleted(otp);
    }
  }

  void _clearFromIndex(int index) {
    controllers[index].clear();
    _emitOtp();
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boxSize = MediaQuery.of(context).size.width / (widget.length * 1.3);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedBuilder(
        animation: _shakeAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_shakeAnimation.value, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.length, (index) {
                return Container(
                  width: boxSize.clamp(42, 55),
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,

                    // 🔥 مهم جداً لـ OTP auto-fill (Google / iOS SMS)
                    autofillHints: const [AutofillHints.oneTimeCode],

                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),

                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: AppColors.fieldBackgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),

                    onChanged: (value) => _handleInput(value, index),

                    onTap: () {
                      controllers[index].selection = TextSelection.fromPosition(
                        TextPosition(offset: controllers[index].text.length),
                      );
                    },

                    onSubmitted: (_) {
                      if (index < widget.length - 1) {
                        focusNodes[index + 1].requestFocus();
                      }
                    },
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
