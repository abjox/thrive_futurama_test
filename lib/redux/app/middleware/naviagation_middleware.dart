import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

import '../../../core/app_router.dart';
import '../../quiz_results/quiz_results_actions.dart';
import '../app_actions.dart';
import '../app_state.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    next(action);

    if (action is NavigatePushAction) {
      navigatorKey.currentContext?.push(action.route.path);
    }

    if (action is NavigatePopAction) {
      navigatorKey.currentContext?.pop();
    }

    if (action is NavigateReplaceAction) {
      navigatorKey.currentContext?.pushReplacementNamed(action.route.name);
    }

    if (action is QuizResultsBackAction) {
      SystemNavigator.pop();
    }
  }
}
