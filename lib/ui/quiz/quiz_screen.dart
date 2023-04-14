import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../redux/quiz/connector/quiz_view_model.dart';
import '../common/bottom_navigation_bar_widget.dart';
import 'components/quiz_question_page_widget.dart';
import 'components/quiz_results_page_widget.dart';

class QuizPageState extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get pageIndex => _currentPageIndex;

  void move() {
    _currentPageIndex++;
    notifyListeners();
  }
}

class QuizScreen extends StatelessWidget {
  final QuizViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const QuizScreen(
    this.viewModel,
    this.scaffoldKey, {
    Key? key,
  }) : super(key: key);

  // int _currentPageIndex = 0;
  // int _correctAnswersCount = 0;

  // void _onAnswerSelected(String answer) {
  //   setState(() {
  //     final currentQuestion = widget.quizQuestions[_currentPageIndex];
  //     if (currentQuestion.correctAnswer == answer) {
  //       _correctAnswersCount++;
  //     }
  //     _currentPageIndex++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizPageState(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: PageView.builder(
          itemCount: viewModel.questionsProps.length + 1,
          itemBuilder: (context, index) {
            if (index == viewModel.questionsProps.length) {
              return QuizResultsPageWidget(
                viewModel.quizResultsProps,
              );
            }
            final props = viewModel.questionsProps[index];
            return QuizQuestionPageWidget(
              key: Key('question_$index'),
              props: props,
            );
          },
        ),
        bottomNavigationBar: Hero(
          tag: 'bottomNavigationBar',
          child: BottomNavigationBarWidget(
            viewModel.bottomNavigationBarProps,
          ),
        ),
      ),
    );
  }
}
