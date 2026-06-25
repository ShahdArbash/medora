import 'package:flutter/material.dart';
import 'package:medoraapp/constants/assets.dart';
import 'package:medoraapp/features/setting/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting/presentation/widgets/SettingView/Settings_Tile_PNG.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/header_title.dart';
import 'package:medoraapp/features/setting/presentation/widgets/SettingView/settings_header.dart';
import 'package:medoraapp/features/setting/presentation/widgets/SettingView/settings_switch_tile.dart';
import 'package:medoraapp/features/setting/presentation/widgets/SettingView/settings_tile_SVG.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.28,
            child: SettingsHeader(
              user: UserProfileModel(
                id: '1',
                name: 'شهد عربش',
                email: 'shahdarbash8@gmail.com',
                phone: "0956672450",
                gender: 'أنثى',
                avatarUrl: Assets.profile,
                birthDate: '25',
                medicalNotes: 'لا يوجد',
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 20),
                HeaderTitle(title: "الإعدادات العامة"),

                const SizedBox(height: 20),
                SettingsTileSVG(
                  title: 'الرئيسية',
                  icon: Assets.home,
                  onTap: () {},
                ),
                const SizedBox(height: 16),

                SettingsTileSVG(
                  title: 'تحاليل',
                  icon: Assets.analysis,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                SettingsTileSVG(
                  title: 'مواعيدي',
                  icon: Assets.appointment,
                  onTap: () {},
                ),

                const SizedBox(height: 16),

                SettingsTilePNG(
                  title: 'بوت الاستفسارات',
                  icon: "assets/chat_icon.png",
                  onTap: () {},
                ),

                const SizedBox(height: 24),
                HeaderTitle(title: "إعدادات التطبيق"),

                const SizedBox(height: 24),

                SettingsSwitchTile(
                  title: 'ثيم التطبيق',
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (val) {},
                ),
                const SizedBox(height: 16),
                SettingsSwitchTile(
                  title: 'إشعارات التطبيق',
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (val) {},
                ),

                const SizedBox(height: 16),

                SettingsTilePNG(
                  title: 'مركز المساعدة',
                  icon: "assets/help.png",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
