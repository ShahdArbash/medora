import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_login/login_cubit.dart';

class LoginScopeView extends StatelessWidget {
  final Widget child;

  const LoginScopeView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginCubit(context.read()))],
      child: child,
    );
  }
}
