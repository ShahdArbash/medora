import 'package:flutter/material.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/skeleton_box.dart';

class TimeGridSkeleton extends StatelessWidget {
  const TimeGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (_, __) {
        return SkeletonBox(height: 40, width: double.infinity);
      },
    );
  }
}
