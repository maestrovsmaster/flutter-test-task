import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_flutter_task/core/theme/app_theme.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/auth/auth_block.dart';
import 'package:pixelfield_flutter_task/presentation/bloc/auth/auth_event.dart';
import 'package:pixelfield_flutter_task/presentation/navigation/app_router.dart';
import 'package:pixelfield_flutter_task/core/di/di_container.dart' as di;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthBloc>()..add(CheckAuthStatusEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Task',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().router,
      ),
    );
  }
}
