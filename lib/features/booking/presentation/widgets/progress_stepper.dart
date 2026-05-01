import 'package:flutter/material.dart';

class ProgressStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressStepper({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return Column(
      children: [
        Text(
          "$currentStep/$totalSteps",
          style: const TextStyle(color: Color(0xFF00AFB4)),
        ),
        const SizedBox(height: 6),
        Container(
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0x2B00A4A6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF00AFB4),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
