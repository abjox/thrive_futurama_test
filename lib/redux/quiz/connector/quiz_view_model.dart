import '../../../ui/quiz/components/quiz_question_page_widget.dart';
import '../../../ui/quiz/components/quiz_results_page_widget.dart';

class QuizViewModel {
  final bool isLoading;
  final bool isError;

  final List<QuizQuestionPageProps> questionsProps;
  final QuizResultsPageProps quizResultsProps;

  QuizViewModel(
    this.isLoading,
    this.isError,
    this.questionsProps,
    this.quizResultsProps,
  );
}
