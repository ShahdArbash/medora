import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/base_card_setting.dart';

class SettingsSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCardSetting(
      child: Row(
        children: [
          Expanded(child: Text(title, style: CairoFonts.bold(fontSize: 14))),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
