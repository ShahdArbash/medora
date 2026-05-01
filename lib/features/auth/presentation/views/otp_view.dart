import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_otp/otp_cubit.dart';
import 'package:medoraapp/features/auth/presentation/widgets/otp_input.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/generic_button.dart';
import 'package:medoraapp/presentation/views/home_view.dart';

class OtpView extends StatefulWidget {
  final String email;

  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String? otpCode;
  bool hasError = false;

  void _submit() {
    if (otpCode == null || otpCode!.length != 6) {
      setState(() => hasError = true);
      return;
    }

    context.read<OtpCubit>().verify(widget.email, otpCode!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تأكيد البريد الإلكتروني")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            Text("أدخل الكود", style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 10),

            Text(widget.email),

            const SizedBox(height: 30),

            OtpInput(
              length: 6,
              hasError: hasError,
              onErrorAnimationEnd: () {
                setState(() => hasError = false);
              },
              onChanged: (code) {
                otpCode = code;
              },
              onCompleted: (code) {
                otpCode = code;
              },
            ),

            const SizedBox(height: 40),

            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if (state is OtpSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeView()),
                  );
                }

                if (state is OtpError) {
                  setState(() => hasError = true);

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: GenericButton(
                    backgroundColor: AppColors.primaryColor,
                    label: 'تأكيد',
                    onPressed: state is OtpLoading ? null : _submit,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
