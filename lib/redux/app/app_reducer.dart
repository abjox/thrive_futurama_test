import 'package:redux/redux.dart';

import '../../ui/common/bottom_navigation_bar_widget.dart';
import '../character_details/character_details_reducer.dart';
import '../characters/characters_reducer.dart';
import '../home/home_reducer.dart';
import '../quiz/quiz_reducer.dart';
import 'app_actions.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    dataStatus: _dataStatusReducer(state.dataStatus, action),
    errorMessage: _errorMessageReducer(state.errorMessage, action),
    selectedItem: _bottomBarReducer(state.selectedItem, action),
    homeState: homeReducer(state.homeState, action),
    charactersState: charactersReducer(state.charactersState, action),
    characterDetailsState:
        characterDetailsReducer(state.characterDetailsState, action),
    quizState: quizReducer(state.quizState, action),
  );
}

final _dataStatusReducer = combineReducers<DataStatus>([
  TypedReducer(_changeDataStatusAction),
]);

final _errorMessageReducer = combineReducers<String?>([
  TypedReducer(_errorOccuredAction),
  TypedReducer(_clearErrorAction),
]);

final _bottomBarReducer = combineReducers<BottomBarItemTypes>([
  TypedReducer(_bottomBarNavigateAction),
]);

DataStatus _changeDataStatusAction(
  DataStatus dataStatus,
  ChangeDataStatusAction action,
) {
  return action.dataStatus;
}

String? _errorOccuredAction(
  String? errorMessage,
  ErrorOccurredAction action,
) {
  return action.message;
}

String? _clearErrorAction(
  String? errorMessage,
  ClearErrorAction action,
) {
  return null;
}

BottomBarItemTypes _bottomBarNavigateAction(
  BottomBarItemTypes selectedItem,
  BottomBarNavigateAction action,
) {
  return action.item;
}
