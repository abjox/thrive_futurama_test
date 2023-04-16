import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/quiz_provider.dart';
import 'quiz_page_widget.dart';

class QuizBodyWidget extends StatefulWidget {
  final int currentQuestionIndex;
  final VoidCallback onQuizFinished;

  const QuizBodyWidget(
    this.currentQuestionIndex,
    this.onQuizFinished, {
    super.key,
  });

  @override
  State<QuizBodyWidget> createState() => _QuizBodyWidgetState();
}

class _QuizBodyWidgetState extends State<QuizBodyWidget> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.currentQuestionIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleAnswerSelected(QuizProvider provider, String answer) {
    provider.selectAnswer(answer);
    if (!provider.isLastQuestion) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      provider.nextQuestion();
    } else {
      widget.onQuizFinished();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: provider.numberOfQuestions,
                itemBuilder: (context, index) {
                  final question = provider.questionFor(index);
                  if (question == null) {
                    return ErrorWidget.withDetails(
                      message: 'There no question for index: $index',
                    );
                  }
                  return QuizPageWidget(
                    question: question.question,
                    possibleAnswers: question.possibleAnswers,
                    userAnswer: provider.answerFor(index),
                    onAnswerSelected: (answer) {
                      _handleAnswerSelected(provider, answer);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    label:
                        'Question ${provider.currentQuestionIndex + 1} of ${provider.numberOfQuestions}',
                    child: Text(
                      'Question ${provider.currentQuestionIndex + 1} of ${provider.numberOfQuestions}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Semantics(
                    label:
                        'Score: ${provider.score}/${provider.numberOfQuestions}',
                    child: Text(
                      'Score: ${provider.score}/${provider.numberOfQuestions}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
