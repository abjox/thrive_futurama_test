import 'package:redux/redux.dart';

import 'app_actions.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
      dataStatus: _dataStatusReducer(state.dataStatus, action),
    );

final _dataStatusReducer = combineReducers<DataStatus>([
  TypedReducer(_changeDataStatusAction),
  TypedReducer(_dismissErrorAction),
]);

DataStatus _changeDataStatusAction(
    DataStatus dataStatus, ChangeDataStatusAction action) {
  return action.dataStatus;
}

DataStatus _dismissErrorAction(
    DataStatus dataStatus, DismissErrorAction action) {
  return DataStatus.success;
}
