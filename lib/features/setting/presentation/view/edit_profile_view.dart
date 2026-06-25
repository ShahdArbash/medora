import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';
import 'package:medoraapp/features/setting/data/model/user_profile_model.dart';
import 'package:medoraapp/features/setting/presentation/widgets/EditView/edit_photo_section.dart';
import 'package:medoraapp/features/setting/presentation/widgets/EditView/gender_bottom_sheet_field.dart';
import 'package:medoraapp/features/setting/presentation/widgets/EditView/profile_filed.dart';
import 'package:medoraapp/features/setting/presentation/widgets/EditView/section_card.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key, required this.user});
  final UserProfileModel user;

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController genderController;
  String? selectedGender;
  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.user.name);

    emailController = TextEditingController(text: widget.user.email);

    phoneController = TextEditingController(text: widget.user.phone);

    genderController = TextEditingController(text: widget.user.gender);
    selectedGender = widget.user.gender;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل حسابي", style: CairoFonts.bold(fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            SizedBox(height: 2),
            EditPhotoSection(image: widget.user.avatarUrl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: SectionCard(
                title: 'المعلومات الشخصية',
                child: Column(
                  spacing: 10,
                  children: [
                    ProfileFiled(
                      text: 'الاسم الكامل',
                      icon: Icons.person_2_outlined,
                      controller: nameController,
                    ),
                    ProfileFiled(
                      text: 'البريد الإلكتروني',
                      icon: Icons.email_outlined,
                      controller: emailController,
                    ),

                    ProfileFiled(
                      text: 'رقم الهاتف',
                      icon: Icons.phone,
                      controller: phoneController,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الجنس', style: CairoFonts.semiBold(fontSize: 12)),
                        SizedBox(height: 8),
                        GenderBottomSheetField(
                          value: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
