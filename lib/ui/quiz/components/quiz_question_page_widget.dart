import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../quiz_screen.dart';

class QuizQuestionPageProps {
  final String question;
  final List<String> possibleAnswers;
  final void Function(String) onAnswerSelected;

  QuizQuestionPageProps(
    this.question,
    this.possibleAnswers,
    this.onAnswerSelected,
  );
}

class QuizQuestionPageWidget extends StatefulWidget {
  final QuizQuestionPageProps props;

  const QuizQuestionPageWidget({
    Key? key,
    required this.props,
  }) : super(key: key);

  @override
  State<QuizQuestionPageWidget> createState() => _QuizQuestionPageWidgetState();
}

class _QuizQuestionPageWidgetState extends State<QuizQuestionPageWidget> {
  int? _selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizPageState>(
      builder: (context, state, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.props.question,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            ...widget.props.possibleAnswers
                .asMap()
                .map(
                  (index, answer) {
                    return MapEntry(
                      index,
                      RadioListTile<int>(
                        title: Text(
                          answer,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        value: index,
                        groupValue: _selectedAnswerIndex,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedAnswerIndex = value;
                            widget.props.onAnswerSelected(
                              widget.props.possibleAnswers[value!],
                            );
                            state.move();
                          });
                        },
                      ),
                    );
                  },
                )
                .values
                .toList(),
          ],
        );
      },
    );
  }
}
