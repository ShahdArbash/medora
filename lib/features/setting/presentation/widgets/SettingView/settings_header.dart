import 'package:flutter/material.dart';
import 'package:medoraapp/constants/assets.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medoraapp/features/setting/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting/presentation/view/profile_view.dart';

class SettingsHeader extends StatelessWidget {
  final UserProfileModel user;

  const SettingsHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              scrolledUnderElevation: 0,
              title: Text(
                "الإعدادات",
                style: CairoFonts.bold(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(user.avatarUrl),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: CairoFonts.bold(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          user.email,
                          style: CairoFonts.regular(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: SvgPicture.asset(
                          Assets.edit,
                          width: 20,
                          height: 20,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileView(user: user),
                            ),
                          );
                          // Handle edit profile action
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
