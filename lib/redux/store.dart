import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:redux/redux.dart';

import '../core/services/network.dart';
import 'app/app_reducer.dart';
import 'app/app_state.dart';
import 'app/middleware/logging_middleware.dart';
import 'app/middleware/naviagation_middleware.dart';

Store<AppState> createStore() {
  // All dependencies should be provided here, outside of implementation
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      NavigationMiddleware(),
      LoggingMiddleware(logger: GetIt.I.get<Logger>()),
    ],
  );
}
