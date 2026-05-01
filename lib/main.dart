import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medoraapp/core/theme/app_theme.dart';
import 'package:medoraapp/features/auth/data/services/api_service.dart';
import 'package:medoraapp/features/auth/data/services/auth_repository.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/views/splash_view.dart';

void main() {
  final apiService = ApiService();
  final authService = AuthService(apiService);
  final authRepository = AuthRepository(authService);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: apiService),
        RepositoryProvider.value(value: authService),
        RepositoryProvider.value(value: authRepository),
      ],
      child: const MedoraAPP(),
    ),
  );
}

class MedoraAPP extends StatelessWidget {
  const MedoraAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,

      supportedLocales: const [Locale('ar'), Locale('en')],

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: AppTheme.theme,

      home: SplashView(),
    );
  }
}
