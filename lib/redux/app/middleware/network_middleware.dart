import 'package:logger/logger.dart';
import 'package:redux/redux.dart';

import '../../../core/network/network_service.dart';
import '../../home/home_actions.dart';
import '../app_state.dart';

class NetworkMiddleware extends MiddlewareClass<AppState> {
  late NetworkServiceProtocol _networkService;
  late Logger _logger;

  NetworkMiddleware(NetworkServiceProtocol networkService, Logger logger) {
    _networkService = networkService;
    _logger = logger;
  }

  @override
  void call(Store<AppState> store, action, next) async {
    next(action);

    switch (action.runtimeType) {
      case HomePrepareDataAction:
        try {
          final infoList = await _networkService.info();
          _logger.d(infoList);
          if (infoList.isNotEmpty) {
            store.dispatch(HomeDataReadyAction(infoList.first));
          }
        } catch (error) {
          _logger.e(error);
        }
        break;
      default:
        break;
    }
  }
}
