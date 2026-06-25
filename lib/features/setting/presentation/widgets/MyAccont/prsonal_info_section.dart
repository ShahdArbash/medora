import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/features/setting/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting/presentation/view/edit_profile_view.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/header_title.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/info_profile.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';

class PrsonalInfoSection extends StatelessWidget {
  const PrsonalInfoSection({super.key, required this.user});

  final UserProfileModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: HeaderTitle(
            title: "المعلومات الشخصية",
            icon: Icons.medical_information_outlined,
          ),
        ),

        Divider(height: 1, color: AppColors.borderColor.withValues(alpha: 0.1)),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              InfoProfile(name: user.name, title: "الاسم الكامل"),
              InfoProfile(name: user.phone, title: 'رقم الجوال'),
              InfoProfile(name: user.email, title: 'البريد الإلكتروني'),
              InfoProfile(name: user.gender, title: 'الجنس'),
              SizedBox(height: 8),
              GenericButton(
                hasBorder: true,
                hasShadow: false,
                label: "تعديل البيانات",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileView(user: user),
                    ),
                  );
                },
                backgroundColor: Colors.transparent,
                textColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
