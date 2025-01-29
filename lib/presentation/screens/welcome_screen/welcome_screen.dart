import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter_task/core/di/di_container.dart';
import 'package:pixelfield_flutter_task/core/theme/app_colors.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/welcome/welcome_event.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/welcome/welcome_state.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/custom_yellow_icon_button.dart';
import 'package:pixelfield_flutter_task/presentation/widgets/welcome_box.dart';

import '../../bloc/welcome/welcome_block.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WelcomeBloc>()..add(CheckAuthStatus()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundBottleDetails,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_bottle_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BlocListener<WelcomeBloc, WelcomeState>(
              listener: (context, state) {
                if (state is WelcomeAuthenticated) {
                  context.pushReplacement('/main');
                }
              },
              child: BlocBuilder<WelcomeBloc, WelcomeState>(
                builder: (context, state) {
                  if (state is WelcomeChecking) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WelcomeBox(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                          decoration: const BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(translate('welcome_title'),
                                  style: Theme.of(context).textTheme.displayLarge),
                              const SizedBox(height: 8),
                              Text(
                                translate('welcome_subtitle'),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: CustomYellowIconButton(
                                  text: translate('scan_bottle'),
                                  height: 56,
                                  onPressed: () {
                                    debugPrint("Button pressed!");
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    translate('have_account'),
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.secondaryText2,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.push('/signIn');
                                    },
                                    child: Text(
                                      translate('sign_in_first'),
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
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
