import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter_task/data/models/item_model.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/bottle_details_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/main_screen/main_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/welcome_screen/welcome_screen.dart';

import 'custom_transitions.dart';


class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/signIn',
          pageBuilder: (context, state) {
            return const CustomTransitionPage(
              child: SignInScreen(),
              transitionsBuilder: slideTransition,
            );
          }

      ),
      GoRoute(
        path: '/main',
          pageBuilder: (context, state) {
            return const CustomTransitionPage(
              child: MainScreen(),
              transitionsBuilder: slideTransition,
            );
          }
      ),
      GoRoute(
        path: '/details',
        pageBuilder: (context, state) {
          final itemId = state.extra as String;
          return CustomTransitionPage(
            child: BottleDetailsScreen(itemId: itemId),
            transitionsBuilder: slideTransition,
          );
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
