import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/base_card_setting.dart';

class SettingsTileSVG extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const SettingsTileSVG({
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
            SvgPicture.asset(
              icon,
              placeholderBuilder: (context) =>
                  const CircularProgressIndicator(),
              width: 24,
              height: 24,
            ),
            SizedBox(width: 12),
            Text(title, style: CairoFonts.bold(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
