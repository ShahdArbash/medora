import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/setting/presentation/widgets/SettingView/image_profile.dart';

class EditPhotoSection extends StatelessWidget {
  const EditPhotoSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageProfile(image: image),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تعديل الصورة",
              style: CairoFonts.semiBold(
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
            ),
            VerticalDivider(),
            Text(
              "حذف الصورة",
              style: CairoFonts.semiBold(
                fontSize: 14,
                color: Color(0xffBA1A1A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
