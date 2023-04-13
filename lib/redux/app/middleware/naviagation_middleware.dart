import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

import '../../../core/app_router.dart';
import '../app_actions.dart';
import '../app_state.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    next(action);

    if (action is NavigatePushAction) {
      navigatorKey.currentContext?.go(action.routeName);
    }

    if (action is NavigatePopAction) {
      navigatorKey.currentContext?.pop();
    }

    if (action is NavigateReplaceAction) {
      navigatorKey.currentContext?.pushReplacementNamed(action.routeName);
    }
  }
}
