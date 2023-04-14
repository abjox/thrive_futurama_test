import '../../../ui/common/bottom_navigation_bar_widget.dart';
import '../../../ui/quiz/components/quiz_question_page_widget.dart';
import '../../../ui/quiz/components/quiz_results_page_widget.dart';

class QuizViewModel {
  final bool isLoading;

  final List<QuizQuestionPageProps> questionsProps;
  final QuizResultsPageProps quizResultsProps;

  final BottomNavigationBarProps bottomNavigationBarProps;

  QuizViewModel({
    required this.isLoading,
    required this.questionsProps,
    required this.quizResultsProps,
    required this.bottomNavigationBarProps,
  });
}
