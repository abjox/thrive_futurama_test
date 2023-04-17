import 'package:logger/logger.dart';
import 'package:redux/redux.dart';

import '../../../core/network/network_service.dart';
import '../../../core/services/connectivity_service.dart';
import '../../characters/characters_actions.dart';
import '../../home/home_actions.dart';
import '../../quiz/quiz_actions.dart';
import '../app_actions.dart';
import '../app_state.dart';

class NetworkMiddleware extends MiddlewareClass<AppState> {
  late NetworkServiceProtocol _networkService;
  late ConnectivityServiceProtocol _connectivityService;
  late Logger _logger;

  NetworkMiddleware(
    NetworkServiceProtocol networkService,
    ConnectivityServiceProtocol connectivityService,
    Logger logger,
  ) {
    _networkService = networkService;
    _connectivityService = connectivityService;
    _logger = logger;
  }

  @override
  Future<void> call(Store<AppState> store, action, next) async {
    next(action);
    final available = await _connectivityService.hasNetworokConnection();
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
          _logger.e('HomePrepareDataAction:', error, stacktrace);
          store.dispatch(
            ErrorOccurredAction('Something went wrong! Please try Again.'),
          );
        }
        break;
      case HomeRefreshDataAction:
        try {
          final infoList = await _networkService.info();
          _logger.d(infoList);
          if (infoList.isNotEmpty) {
            store.dispatch(HomeDataReadyAction(infoList.first));
          }
          (action as HomeRefreshDataAction).completer.complete();
        } catch (error, stacktrace) {
          _logger.e('HomePrepareDataAction:', error, stacktrace);
          (action as HomeRefreshDataAction).completer.complete();
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
      case CharactersRefreshDataAction:
        try {
          final characters = await _networkService.characters();
          _logger.d(characters);
          if (characters.isNotEmpty) {
            store.dispatch(CharactersDataReadyAction(characters));
          }
          (action as CharactersRefreshDataAction).completer.complete();
        } catch (error, stacktrace) {
          _logger.e('CharactersPrepareDataAction:', error, stacktrace);
          (action as CharactersRefreshDataAction).completer.complete();
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
}
