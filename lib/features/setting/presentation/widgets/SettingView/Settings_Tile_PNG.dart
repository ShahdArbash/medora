import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/base_card_setting.dart';

class SettingsTilePNG extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const SettingsTilePNG({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: BaseCardSetting(
        child: Row(
          children: [
            Image.asset(icon),
            SizedBox(width: 12),
            Text(title, style: CairoFonts.bold(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
