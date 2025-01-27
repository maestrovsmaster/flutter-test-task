import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/bottle_details_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/main_screen/main_screen.dart';

import 'custom_transitions.dart';


class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: '/main',
    routes: [
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/details',
        pageBuilder: (context, state) {
          final item = state.extra as ItemModel;
          return CustomTransitionPage(
            child: BottleDetailsScreen(item: item),
            transitionsBuilder: slideTransition,
          );
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
