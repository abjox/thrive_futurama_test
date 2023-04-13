import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrive_futurama/ui/storybook/storybook_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

enum AppRoutes {
  home('/home'),
  storybook('/storybook');

  final String routeName;
  const AppRoutes(this.routeName);
}

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() {
    return _instance;
  }

  AppRouter._internal();

  GoRouter get config {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: AppRoutes.storybook.routeName,
      routes: [
        GoRoute(
          path: AppRoutes.storybook.routeName,
          builder: (context, state) => const StorybookScreen(),
        ),
        GoRoute(
          path: AppRoutes.home.routeName,
          builder: (context, state) => Container(),
        ),
      ],
    );
  }
}
