import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';
import 'package:redux/redux.dart';

import '../../../core/network/network_service.dart';
import '../../characters/characters_actions.dart';
import '../../home/home_actions.dart';
import '../../quiz/quiz_actions.dart';
import '../app_actions.dart';
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
    final available = await _isNetworkAvailable();
    if (!available) {
      store.dispatch(ErrorOccurredAction('No internet connection!'));
      return;
    }
    switch (action.runtimeType) {
      case HomePrepareDataAction:
        store.dispatch(ChangeDataStatusAction(DataStatus.inProgress));
        try {
          final infoList = await _networkService.info();
          _logger.d(infoList);
          if (infoList.isNotEmpty) {
            store.dispatch(HomeDataReadyAction(infoList.first));
          }
        } catch (error, stacktrace) {
          _logger.e('CharactersPrepareDataAction:', error, stacktrace);
          store.dispatch(
            ErrorOccurredAction('Something went wrong! Please try Again.'),
          );
        }
        break;
      case CharactersPrepareDataAction:
        store.dispatch(ChangeDataStatusAction(DataStatus.inProgress));
        try {
          final characters = await _networkService.characters();
          _logger.d(characters);
          if (characters.isNotEmpty) {
            store.dispatch(CharactersDataReadyAction(characters));
          }
        } catch (error, stacktrace) {
          _logger.e('CharactersPrepareDataAction:', error, stacktrace);
          store.dispatch(
            ErrorOccurredAction('Something went wrong! Please try Again.'),
          );
        }
        break;
      case QuizPrepareDataAction:
        store.dispatch(ChangeDataStatusAction(DataStatus.inProgress));
        try {
          final questions = await _networkService.questions();
          _logger.d(questions);
          if (questions.isNotEmpty) {
            store.dispatch(QuizDataReadyAction(questions));
          }
        } catch (error, stacktrace) {
          _logger.e('QuizPrepareDataAction:', error, stacktrace);
          store.dispatch(
            ErrorOccurredAction('Something went wrong! Please try Again.'),
          );
        }
        break;
      default:
        break;
    }
  }

  Future<bool> _isNetworkAvailable() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
