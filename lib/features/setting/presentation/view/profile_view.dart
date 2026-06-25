import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/setting/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/general_border_card.dart';
import 'package:medoraapp/features/setting/presentation/widgets/SettingView/image_profile.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/note_section.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/prsonal_info_section.dart';

class ProfileView extends StatelessWidget {
  final UserProfileModel user;
  const ProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حسابي", style: CairoFonts.bold(fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            SizedBox(height: 2),
            ImageProfile(image: user.avatarUrl),
            const SizedBox(height: 12),
            Text(user.name, style: CairoFonts.bold(fontSize: 14)),
            Text(user.email, style: CairoFonts.regular(fontSize: 12)),
            GeneralBorderCard(child: PrsonalInfoSection(user: user)),
            GeneralBorderCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: NoteSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
