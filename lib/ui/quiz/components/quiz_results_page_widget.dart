import 'package:flutter/material.dart';

class QuestionResult {
  final bool isCorrect;
  final String question;
  final String userAnswer;

  QuestionResult(
    this.isCorrect,
    this.question,
    this.userAnswer,
  );
}

class QuizResultsPageProps {
  final int score;
  final List<QuestionResult> results;
  final VoidCallback onRestart;

  QuizResultsPageProps(this.score, this.results, this.onRestart);
}

class QuizResultsPageWidget extends StatelessWidget {
  final QuizResultsPageProps props;

  const QuizResultsPageWidget(this.props, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You scored ${props.score} out of ${props.results.length}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16.0),
          Text(
            'Here are the answers you gave:',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: props.results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    props.results[index].question,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    'You answered: ${props.results[index].userAnswer}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Icon(
                    props.results[index].isCorrect ? Icons.check : Icons.close,
                    color: props.results[index].isCorrect
                        ? Colors.green
                        : Colors.red,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: props.onRestart,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
