import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/auth/data/services/api_service.dart';
import 'package:medoraapp/features/auth/data/services/auth_repository.dart';
import 'package:medoraapp/features/auth/data/services/auth_service.dart';
import 'package:medoraapp/medora_app.dart';

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
