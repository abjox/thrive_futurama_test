import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../redux/characters/connector/characters_connector.dart';
import '../redux/home/connector/home_connector.dart';
import '../redux/quiz/connector/quiz_connector.dart';
import '../ui/storybook/storybook_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

enum AppRoutes {
  home('/home'),
  characters('/characters'),
  quiz('/quiz'),
  storybook('/storybook');

  final String path;
  const AppRoutes(this.path);
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
      initialLocation: AppRoutes.home.path,
      routes: [
        GoRoute(
          path: AppRoutes.storybook.path,
          name: AppRoutes.storybook.name,
          builder: (context, state) => const StorybookScreen(),
        ),
        GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: HomeConnector());
          },
        ),
        GoRoute(
          path: AppRoutes.characters.path,
          name: AppRoutes.characters.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: CharactersConnector());
          },
        ),
        GoRoute(
          path: AppRoutes.quiz.path,
          name: AppRoutes.quiz.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: QuizConnector());
          },
        ),
      ],
    );
  }
}
