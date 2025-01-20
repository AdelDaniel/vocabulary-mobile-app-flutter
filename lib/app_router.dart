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
        builder: (context, state) => const GetStartedScreen(),
      ),
      GoRoute(
        path: homeScreenRouteName,
        builder: (context, state) => const AppNavigationScreen(),
      ),
      GoRoute(
        path: onboardingScreenRouteName,
        builder: (context, state) => const OnboardingScreen(),
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
}
