import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:voca_app/feature/home/screen/home_screen.dart';
import 'package:voca_app/feature/onboarding/screen/onboarding_screen.dart';
import 'package:voca_app/feature/get_started/screen/get_started_screen.dart';

class AppRouter {
  static const getStartedScreenRouteName = "/get-started";
  static const homeScreenRouteName = "/";
  static const onboardingScreenRouteName = "/onboarding";

  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: getStartedScreenRouteName,
    redirect: _redirect,
    routes: <RouteBase>[
      GoRoute(
        path: getStartedScreenRouteName,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const GetStartedScreen(),
        ),
      ),
      GoRoute(
        path: homeScreenRouteName,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: onboardingScreenRouteName,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const OnboardingScreen(),
        ),
      ),
    ],
  );

  static FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    log(state.uri.toString(), name: "redirect");
    return null;
  }

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      transitionDuration: const Duration(milliseconds: 300),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}
