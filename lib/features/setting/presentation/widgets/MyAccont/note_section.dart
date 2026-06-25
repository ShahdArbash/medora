import 'package:flutter/material.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/header_title.dart';
import 'package:medoraapp/features/setting/presentation/widgets/MyAccont/note_card.dart';

class NoteSection extends StatelessWidget {
  const NoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        HeaderTitle(
          title: "الملاحظات الطبية",
          icon: Icons.edit_calendar_rounded,
        ),
        NoteCard(
          text: """يوجد حساسية من البنسلين. مريض سكري
من النوع الثاني. يتناول أدوية لسيولة الدم
بانتظام.""",
        ),
      ],
    );
  }
}
