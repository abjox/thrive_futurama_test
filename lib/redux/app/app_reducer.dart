import 'package:redux/redux.dart';

import '../../ui/common/bottom_navigation_bar_widget.dart';
import '../characters/characters_reducer.dart';
import '../home/home_reducer.dart';
import 'app_actions.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    dataStatus: _dataStatusReducer(state.dataStatus, action),
    selectedItem: _bottomBarReducer(state.selectedItem, action),
    homeState: homeReducer(state.homeState, action),
    charactersState: charactersReducer(state.charactersState, action),
  );
}

final _dataStatusReducer = combineReducers<DataStatus>([
  TypedReducer(_changeDataStatusAction),
  TypedReducer(_dismissErrorAction),
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

DataStatus _dismissErrorAction(
  DataStatus dataStatus,
  DismissErrorAction action,
) {
  return DataStatus.success;
}

BottomBarItemTypes _bottomBarNavigateAction(
  BottomBarItemTypes selectedItem,
  BottomBarNavigateAction action,
) {
  return action.item;
}
