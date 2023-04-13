import 'package:logger/logger.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

class LoggingMiddleware extends MiddlewareClass<AppState> {
  final Logger logger;

  LoggingMiddleware({
    required this.logger,
  });

  @override
  void call(Store<AppState> store, action, next) async {
    next(action);

    switch (action.runtimeType) {
      default:
        logger.log(Level.info, action.toString());
    }
  }
}
