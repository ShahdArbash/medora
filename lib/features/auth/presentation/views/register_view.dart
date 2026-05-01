import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/validators/confirm_password_validator.dart';
import 'package:medoraapp/core/validators/email_validator.dart';
import 'package:medoraapp/core/validators/name_validator.dart';
import 'package:medoraapp/core/validators/password_validator.dart';
import 'package:medoraapp/features/auth/data/models/register_request.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_register/register_cubit.dart';
import 'package:medoraapp/features/auth/logic/Cubits/cubit_register/register_state.dart';
import 'package:medoraapp/features/auth/presentation/views/login_scope_view.dart';
import 'package:medoraapp/features/auth/presentation/views/login_view.dart';
import 'package:medoraapp/features/auth/presentation/views/otp_scope_view.dart';
import 'package:medoraapp/features/auth/presentation/views/otp_view.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Buttons/signUp_action_button.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/confirm_password_field.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/full_name_field.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/email_field.dart';
import 'package:medoraapp/presentation/Widgets/Form_Fields/password_field_with_ animated_switcher.dart';
import 'package:medoraapp/features/auth/presentation/widgets/Login_View_Widgets/google_sign_in_widget.dart';
import 'package:medoraapp/presentation/Widgets/Texts/title_text.dart';
import '../../../../presentation/Widgets/Methods/build_background_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  // Controllers (single source of truth)
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // 🚀 Submit logic isolated (clean)
  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final request = RegisterRequest(
        name: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      context.read<RegisterCubit>().register(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        decoration: BiuldBackgroundView(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  // Title
                  TitleText(title: l10n.signupTitle),
                  const SizedBox(height: 50),

                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OtpScopeView(
                              child: OtpView(
                                email: _emailController.text.trim(),
                              ),
                            ),
                          ),
                        );
                      }

                      if (state is RegisterError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },

                    builder: (context, state) {
                      final isLoading = state is RegisterLoading;

                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FullNameField(
                              controller: _fullNameController,
                              validator: (v) => nameValidator(v, context),
                            ),
                            const SizedBox(height: 16),

                            EmailField(
                              controller: _emailController,
                              validator: (v) => emailValidator(v, context),
                            ),
                            const SizedBox(height: 16),

                            PasswordFieldWithRules(
                              controller: _passwordController,
                              validator: (v) => passwordValidator(v, context),
                            ),
                            const SizedBox(height: 16),

                            ConfirmPasswordField(
                              controller: _confirmPasswordController,
                              passwordController: _passwordController,
                              validator: (v) => confirmPasswordValidator(
                                v,
                                _passwordController.text,
                                context,
                              ),
                            ),

                            const SizedBox(height: 20),

                            SignUpActionButton(
                              isLoading: isLoading,
                              formKey: _formKey,
                              onSubmit: () => _submit(context),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 25),

                  const GoogleSignInWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
