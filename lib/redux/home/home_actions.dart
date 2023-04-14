import '../../core/network/model/info.dart';

class HomePrepareDataAction {}

class HomeDataReadyAction {
  final Info info;

  HomeDataReadyAction(this.info);
}
