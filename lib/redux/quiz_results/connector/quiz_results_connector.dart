import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../ui/quiz_results/quiz_results_screen.dart';
import '../../app/app_state.dart';
import '../../quiz/quiz_actions.dart';
import '../quiz_results_actions.dart';
import 'quiz_results_view_model.dart';

class QuizResultsConnector extends StatelessWidget {
  final GlobalKey<ScaffoldState> _quizResultsGlobalKey = GlobalKey();

  QuizResultsConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, QuizResultsViewModel>(
      distinct: true,
      converter: (store) {
        return QuizResultsViewModel(
          onClose: () {
            store.dispatch(QuizPrepareDataAction());
            store.dispatch(QuizResultsCloseAction());
          },
        );
      },
      builder: (context, viewModel) => QuizResultsScreen(
        viewModel,
        _quizResultsGlobalKey,
      ),
    );
  }
}
