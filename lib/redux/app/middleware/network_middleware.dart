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
    switch (action.runtimeType) {
      case HomePrepareDataAction:
        store.dispatch(ChangeDataStatusAction(DataStatus.inProgress));
        try {
          final infoList = await _networkService.info();
          _logger.d(infoList);
          if (infoList.isNotEmpty) {
            store.dispatch(HomeDataReadyAction(infoList.first));
            store.dispatch(ChangeDataStatusAction(DataStatus.success));
          }
        } catch (error) {
          _logger.e(error);
          store.dispatch(ChangeDataStatusAction(DataStatus.error));
        }
        break;
      case CharactersPrepareDataAction:
        store.dispatch(ChangeDataStatusAction(DataStatus.inProgress));
        try {
          final characters = await _networkService.characters();
          _logger.d(characters);
          if (characters.isNotEmpty) {
            store.dispatch(CharactersDataReadyAction(characters));
            store.dispatch(ChangeDataStatusAction(DataStatus.success));
          }
        } catch (error, stacktrace) {
          _logger.e('CharactersPrepareDataAction:', error, stacktrace);
          store.dispatch(ChangeDataStatusAction(DataStatus.error));
        }
        break;
      case QuizPrepareDataAction:
        store.dispatch(ChangeDataStatusAction(DataStatus.inProgress));
        try {
          final questions = await _networkService.questions();
          _logger.d(questions);
          if (questions.isNotEmpty) {
            store.dispatch(QuizDataReadyAction(questions));
            store.dispatch(ChangeDataStatusAction(DataStatus.success));
          }
        } catch (error) {
          _logger.e(error);
          store.dispatch(ChangeDataStatusAction(DataStatus.error));
        }
        break;
      default:
        break;
    }
  }
}
