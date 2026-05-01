import 'package:flutter/material.dart';
import 'package:medoraapp/presentation/Widgets/AppSkeleton/skeleton_box.dart';
import 'package:shimmer/shimmer.dart';

class AppointmentSkeleton extends StatelessWidget {
  const AppointmentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (_, __) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              SkeletonBox(height: 14, width: 120),
              SizedBox(height: 10),
              SkeletonBox(height: 12, width: 80),
              SizedBox(height: 6),
              SkeletonBox(height: 12, width: 100),
            ],
          ),
        ),
      ),
    );
  }
}
