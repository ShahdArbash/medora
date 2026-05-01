import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_otp/otp_cubit.dart';

class OtpScopeView extends StatelessWidget {
  final Widget child;

  const OtpScopeView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => OtpCubit(context.read()))],
      child: child,
    );
  }
}
