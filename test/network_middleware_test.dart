import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:thrive_futurama/core/network/model/character.dart';
import 'package:thrive_futurama/core/network/model/info.dart';
import 'package:thrive_futurama/core/network/model/question.dart';
import 'package:thrive_futurama/core/network/network_service.dart';
import 'package:thrive_futurama/core/services/connectivity_service.dart';
import 'package:thrive_futurama/redux/app/app_reducer.dart';
import 'package:thrive_futurama/redux/app/app_state.dart';
import 'package:thrive_futurama/redux/app/middleware/network_middleware.dart';
import 'package:thrive_futurama/redux/characters/characters_actions.dart';
import 'package:thrive_futurama/redux/home/home_actions.dart';
import 'package:thrive_futurama/redux/quiz/quiz_actions.dart';

import 'network_middleware_test.mocks.dart';

@GenerateMocks([
  NetworkServiceProtocol,
  ConnectivityServiceProtocol,
  Logger,
  Info,
  Character,
  Question,
])
void main() {
  group('NetworkMiddleware', () {
    late Store<AppState> store;
    late NetworkServiceProtocol networkService;
    late ConnectivityServiceProtocol connectivityService;
    late MockLogger logger;
    late NetworkMiddleware middleware;

    setUp(() {
      store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );
      networkService = MockNetworkServiceProtocol();
      connectivityService = MockConnectivityServiceProtocol();
      logger = MockLogger();
      middleware = NetworkMiddleware(
        networkService,
        connectivityService,
        logger,
      );
    });

    test(
        'dispatches ErrorOccurredAction when there is no network connection for HomePrepareDataAction',
        () async {
      when(networkService.info()).thenThrow(Exception('No network connection'));
      when(connectivityService.hasNetworokConnection())
          .thenAnswer((_) async => false);

      final action1 = HomePrepareDataAction();

      await middleware.call(store, action1, (dynamic action) => null);

      expect(store.state.errorMessage, isNotNull);
      expect(store.state.errorMessage!, equals('No internet connection!'));
    });

    test('dispatches HomeDataReadyAction when network service returns info',
        () async {
      final mockInfo = MockInfo();
      when(networkService.info()).thenAnswer((_) async => [mockInfo]);
      when(connectivityService.hasNetworokConnection())
          .thenAnswer((_) async => true);

      final action = HomePrepareDataAction();

      await middleware.call(store, action, (dynamic action) => null);

      expect(store.state.homeState.info, isNotNull);
      expect(store.state.homeState.info, equals(mockInfo));
    });

    test(
        'dispatches CharactersDataReadyAction when network service returns characters',
        () async {
      final mockCharacter = MockCharacter();
      when(networkService.characters())
          .thenAnswer((_) async => [mockCharacter]);
      when(connectivityService.hasNetworokConnection())
          .thenAnswer((_) async => true);

      final action = CharactersPrepareDataAction();

      await middleware.call(store, action, (dynamic action) => null);

      expect(store.state.charactersState.characters, isNotNull);
      expect(store.state.charactersState.characters, isNotEmpty);
      expect(store.state.charactersState.characters, equals([mockCharacter]));
    });

    test(
        'should dispatch QuizDataReadyAction when QuizPrepareDataAction is dispatched and network is available',
        () async {
      final mock1 = MockQuestion();
      final mock2 = MockQuestion();
      // arrange
      final action = QuizPrepareDataAction();
      final questions = [mock1, mock2];

      when(networkService.questions()).thenAnswer((_) async => questions);
      when(connectivityService.hasNetworokConnection())
          .thenAnswer((_) async => true);

      // act
      await middleware.call(store, action, (_) {});

      // assert
      verify(networkService.questions()).called(1);
      expect(store.state.quizState.questions, isNotNull);
      expect(store.state.quizState.questions, isNotEmpty);
      expect(store.state.quizState.questions, equals(questions));
    });

    test(
        'should dispatch ErrorOccurredAction when network is not available for CharactersPrepareDataAction',
        () async {
      // arrange
      final action = CharactersPrepareDataAction();

      when(networkService.characters()).thenAnswer((_) async => []);
      when(connectivityService.hasNetworokConnection())
          .thenAnswer((_) async => false);

      // act
      await middleware.call(store, action, (_) {});

      // assert
      verifyNever(networkService.characters());
      expect(store.state.errorMessage, isNotNull);
      expect(store.state.errorMessage!, equals('No internet connection!'));
    });

    test(
        'should dispatch ErrorOccurredAction when an error occurs while fetching data for QuizPrepareDataAction',
        () async {
      // arrange
      final mock1 = MockQuestion();
      final mock2 = MockQuestion();
      // arrange
      final action = QuizPrepareDataAction();
      final questions = [mock1, mock2];

      when(networkService.questions()).thenAnswer((_) async => questions);
      when(connectivityService.hasNetworokConnection())
          .thenAnswer((_) async => false);

      // act
      await middleware.call(store, action, (_) {});

      // assert

      verifyNever(networkService.questions());
      expect(store.state.errorMessage, isNotNull);
      expect(store.state.errorMessage!, equals('No internet connection!'));
    });
  });
}
