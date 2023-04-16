import 'package:flutter/material.dart';

import 'answer_button_widget.dart';

class QuizPageWidget extends StatelessWidget {
  final String question;
  final List<String> possibleAnswers;
  final String? userAnswer;
  final ValueChanged<String> onAnswerSelected;

  const QuizPageWidget({
    super.key,
    required this.question,
    required this.possibleAnswers,
    required this.userAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final answerButtons = possibleAnswers.map((q) {
      return AnswerButtonWidget(
        answerText: q,
        isSelected: q == userAnswer,
        onPressed: () => onAnswerSelected(q),
      );
    }).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ...answerButtons,
          ],
        ),
      ),
    );
  }
}
