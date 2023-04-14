import 'package:logger/logger.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

class LoggingMiddleware extends MiddlewareClass<AppState> {
  late Logger _logger;

  LoggingMiddleware(Logger logger) {
    _logger = logger;
  }

  @override
  void call(Store<AppState> store, action, next) async {
    next(action);

    switch (action.runtimeType) {
      default:
        _logger.log(Level.info, action.toString());
    }
  }
}
