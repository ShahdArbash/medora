import 'package:flutter/material.dart';

class BaseCardSetting extends StatelessWidget {
  const BaseCardSetting({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF8F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}

/** */
