import 'package:go_router/go_router.dart';
import 'package:pixelfield_flutter_task/presentation/screens/bottle_details/bottle_details_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/main_screen/main_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:pixelfield_flutter_task/presentation/screens/welcome_screen/welcome_screen.dart';

import 'custom_transitions.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String signIn = '/signIn';
  static const String main = '/main';
  static const String details = '/details';
}

class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.welcome,
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
          path: AppRoutes.signIn,
          pageBuilder: (context, state) {
            return const CustomTransitionPage(
              child: SignInScreen(),
              transitionsBuilder: slideTransition,
            );
          }),
      GoRoute(
          path: AppRoutes.main,
          pageBuilder: (context, state) {
            return const CustomTransitionPage(
              child: MainScreen(),
              transitionsBuilder: slideTransition,
            );
          }),
      GoRoute(
        path: AppRoutes.details,
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
