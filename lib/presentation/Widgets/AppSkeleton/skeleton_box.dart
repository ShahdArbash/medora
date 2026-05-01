import 'package:flutter/material.dart';

class SkeletonBox extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const SkeletonBox({
    super.key,
    required this.height,
    required this.width,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
