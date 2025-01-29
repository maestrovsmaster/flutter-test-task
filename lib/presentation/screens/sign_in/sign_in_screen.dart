import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter_task/core/di/di_container.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/sign_in/sign_in_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/sign_in/sign_in_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/custom_app_bar.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/custom_text_field.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/custom_yellow_icon_button.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/remember_me_checkbox.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignInBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(
          title: translate('sign_in'),
          onBack: () => Navigator.of(context).pop(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInInitial) {
                emailController.text = state.mockEmail;
                passwordController.text = state.mockPassword;
              }

              if (state is SignInLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accentColor,
                    ));
              }

              if (state is SignInFailure) {

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.message,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.errorColor,
                        )),
                    const SizedBox(height: 16),
                    _buildSignInForm(context, false),
                  ],
                );
              }

              if (state is SignInSuccess) {
                _navigateToMainScreen(context);
                return Center(
                    child: Text(translate('login_successful'),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.white,
                        )));
              }

              final isChecked = (state is RememberMeUpdated)
                  ? state.value
                  : context.read<SignInBloc>().rememberMe;

              return _buildSignInForm(context, isChecked);
            },
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToMainScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (context.mounted) {
      context.go('/main');
    }
  }

  Widget _buildSignInForm(BuildContext context, bool isCheckedRememberMe) {



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: translate('email'),
          controller: emailController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: translate('password'),
          controller: passwordController,
          isPassword: true,
          showPassword: showPassword,
          onTogglePassword: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
        const SizedBox(height: 20),
        RememberMeCheckbox(initialValue: isCheckedRememberMe,
          onChanged: (value) => context.read<SignInBloc>().add(ToggleRememberMe(value: value)),
        ),
        const SizedBox(height: 40),
        CustomYellowIconButton(
          text: translate('continue'),
          height: 56,
          onPressed: () {
            final email = emailController.text;
            final password = passwordController.text;

            context
                .read<SignInBloc>()
                .add(FetchLogin(email: email, password: password, rememberMe: isCheckedRememberMe));
          },
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              translate('cant_sign_in'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.secondaryText2,
                  ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                // Navigate to RecoverPassword screen
              },
              child: Text(
                translate('recover_password'),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.accentColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
