import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.iconBackgroundColor,
          child: CircleAvatar(
            radius: 48,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 45, backgroundImage: AssetImage(image)),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          child: GestureDetector(
            onTap: () {
              // TODO: فتح المعرض أو الكاميرا
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
