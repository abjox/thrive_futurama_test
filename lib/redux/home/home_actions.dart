import '../../core/network/model/info.dart';
import '../app/app_actions.dart';
import '../app/app_state.dart';

class HomePrepareDataAction {}

class HomeDataReadyAction extends ClearErrorAction
    implements ChangeDataStatusAction {
  final Info info;

  HomeDataReadyAction(this.info);

  @override
  DataStatus get dataStatus => DataStatus.success;
}
