import 'package:redux/redux.dart';

import 'home_actions.dart';
import 'home_state.dart';

final homeReducer = combineReducers<HomeState>([
  TypedReducer(_homeDataReadyAction),
]);

HomeState _homeDataReadyAction(
    HomeState homeState, HomeDataReadyAction action) {
  return homeState.copyWith(info: action.info);
}
