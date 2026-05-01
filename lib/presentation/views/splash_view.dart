import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medoraapp/constants/assets.dart';
import 'package:medoraapp/core/storage/token_storage.dart';
import 'package:medoraapp/features/auth/presentation/views/login_scope_view.dart';
import 'package:medoraapp/features/auth/presentation/views/login_view.dart';
import 'package:medoraapp/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await TokenStorage.isLoggedIn();

    if (!mounted) return;

    if (isLoggedIn) {
      //  المستخدم مسجل → Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeView()),
      );
    } else {
      //  مو مسجل → Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScopeView(child: const LoginView()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Image.asset(Assets.logo)),
      ),
    );
  }
}
