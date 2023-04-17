import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/quiz_provider.dart';
import '../../redux/quiz_results/connector/quiz_results_view_model.dart';

class QuizResultsScreen extends StatelessWidget {
  final QuizResultsViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const QuizResultsScreen(
    this.viewModel,
    this.scaffoldKey, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        viewModel.onBack();
        return false;
      },
      child: Consumer<QuizProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Semantics(
                label: 'Quiz Results',
                child: const Text('Quiz Results'),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Semantics(
                    label:
                        'You got ${provider.score} out of ${provider.numberOfQuestions} correct!',
                    child: Text(
                      'You got ${provider.score} out of ${provider.numberOfQuestions} correct!',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.numberOfQuestions,
                      itemBuilder: (context, index) {
                        final question = provider.questionFor(index);
                        return ListTile(
                          title: Semantics(
                            label: question?.question ?? '',
                            child: Text(
                              question?.question ?? '',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          subtitle: Semantics(
                            label: 'You answered: ${provider.answerFor(index)}',
                            child: Text(
                              'You answered: ${provider.answerFor(index)}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          trailing: Semantics(
                            label: provider.isCorrectAnswerFor(question)
                                ? 'Correct'
                                : 'Incorrect',
                            child: Icon(
                              provider.isCorrectAnswerFor(question)
                                  ? Icons.check
                                  : Icons.close,
                              color: provider.isCorrectAnswerFor(question)
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Semantics(
                    label: 'Restart Quiz',
                    button: true,
                    child: ElevatedButton(
                      onPressed: () {
                        provider.reset();
                        viewModel.onRestart();
                      },
                      child: const Text('Restart Quiz'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
