import 'package:redux/redux.dart';

import 'quiz_actions.dart';
import 'quiz_state.dart';

final quizReducer = combineReducers<QuizState>([
  TypedReducer(_quizDataReadyAction),
]);

QuizState _quizDataReadyAction(
    QuizState homeState, QuizDataReadyAction action) {
  return homeState.copyWith(questions: action.questions);
}
