import '../../core/app_router.dart';
import '../../core/network/model/question.dart';
import '../app/app_actions.dart';
import '../app/app_state.dart';

class QuizPrepareDataAction {}

class QuizDataReadyAction extends ClearErrorAction
    implements ChangeDataStatusAction {
  final List<Question> questions;

  QuizDataReadyAction(this.questions);

  @override
  DataStatus get dataStatus => DataStatus.success;
}

class QuizOpenResultsAction implements NavigatePushAction {
  @override
  AppRoutes get route => AppRoutes.quizResults;
}
