import 'dart:async';

import '../../core/network/model/info.dart';
import '../app/app_actions.dart';
import '../app/app_state.dart';

class HomeOpenAction {}

class HomePrepareDataAction {}

class HomeRefreshDataAction {
  final Completer completer;

  HomeRefreshDataAction(this.completer);
}

class HomeDataReadyAction extends ClearErrorAction
    implements ChangeDataStatusAction {
  final Info info;

  HomeDataReadyAction(this.info);

  @override
  DataStatus get dataStatus => DataStatus.success;
}
