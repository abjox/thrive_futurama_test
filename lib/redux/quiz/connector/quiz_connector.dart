import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import '../../../providers/quiz_provider.dart';
import '../../../ui/common/bottom_navigation_bar_widget.dart';
import '../../../ui/quiz/quiz_screen.dart';
import '../../app/app_actions.dart';
import '../../app/app_state.dart';
import '../quiz_actions.dart';
import 'quiz_view_model.dart';

class QuizConnector extends StatelessWidget {
  final GlobalKey<ScaffoldState> _quizGlobalKey = GlobalKey();

  QuizConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, QuizViewModel>(
      distinct: true,
      onInit: (store) {
        final quizState = store.state.quizState;
        if (quizState.questions.isNotEmpty) {
          store.dispatch(QuizOpenAction());
          return;
        }
        store.dispatch(QuizPrepareDataAction());
      },
      converter: (store) {
        Provider.of<QuizProvider>(context, listen: false).setup(
          store.state.quizState.questions,
        );
        return QuizViewModel(
          isLoading: store.state.dataStatus == DataStatus.inProgress,
          errorMessage: store.state.errorMessage,
          onReset: () => store.dispatch(QuizPrepareDataAction()),
          bottomNavigationBarProps: _mapToBarProps(store),
          onQuizResults: () => store.dispatch(QuizOpenResultsAction()),
        );
      },
      builder: (context, viewModel) => QuizScreen(
        viewModel,
        _quizGlobalKey,
      ),
    );
  }

  BottomNavigationBarProps _mapToBarProps(Store<AppState> store) {
    return BottomNavigationBarProps(
      store.state.selectedItem,
      () => store.dispatch(BottomBarNavigateAction(BottomBarItemTypes.home)),
      () => store
          .dispatch(BottomBarNavigateAction(BottomBarItemTypes.characters)),
      () => store.dispatch(BottomBarNavigateAction(BottomBarItemTypes.quiz)),
    );
  }
}
