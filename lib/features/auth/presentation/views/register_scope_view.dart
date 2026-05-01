import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_register/register_cubit.dart';

class RegisterScopeView extends StatelessWidget {
  final Widget child;

  const RegisterScopeView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => RegisterCubit(context.read()))],
      child: child,
    );
  }
}
