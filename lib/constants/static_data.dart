import 'package:flutter/material.dart';
import 'package:medoraapp/features/analysis/presentation/view/AnalysisCategoryView/analysis_scope.dart';
import 'package:medoraapp/features/lab_analysis/presentation/views/ocr_test_view.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Home_View_Widgets/service_tile.dart';

List<ServiceTile> getListServices(BuildContext context) {
  return [
    ServiceTile(
      title: AppLocalizations.of(context)!.testPrices,
      icon: Icons.list_alt_sharp,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AnalysisScopeView()),
        );
      },
    ),
    ServiceTile(
      title: AppLocalizations.of(context)!.uploadTest,
      icon: Icons.upload_file,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OcrTestView()),
        );
      },
    ),
    ServiceTile(
      title: AppLocalizations.of(context)!.bookAppointment,
      icon: Icons.calendar_month_rounded,
      onTap: () {},
    ),
  ];
}

List<BottomNavigationBarItem> getListNavBar(BuildContext context) {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      activeIcon: Icon(Icons.home_rounded),
      label: AppLocalizations.of(context)!.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt_rounded),
      activeIcon: Icon(Icons.list_alt_rounded),
      label: AppLocalizations.of(context)!.testPrices,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_rounded),
      activeIcon: Icon(Icons.calendar_month_rounded),
      label: AppLocalizations.of(context)!.appointments,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_rounded),
      activeIcon: Icon(Icons.chat_rounded),
      label: AppLocalizations.of(context)!.chatBot,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      activeIcon: Icon(Icons.person_rounded),
      label: AppLocalizations.of(context)!.profile,
    ),
  ];
}
