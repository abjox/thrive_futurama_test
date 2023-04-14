import '../../core/network/model/question.dart';

class QuizPrepareDataAction {}

class QuizDataReadyAction {
  final List<Question> questions;

  QuizDataReadyAction(this.questions);
}
