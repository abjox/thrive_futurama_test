import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:thrive_futurama/redux/quiz/connector/quiz_view_model.dart';
import 'package:thrive_futurama/ui/quiz/components/quiz_results_page_widget.dart';
import 'package:thrive_futurama/ui/quiz/quiz_screen.dart';

import '../../../ui/common/bottom_navigation_bar_widget.dart';
import '../../../ui/home/components/home_body_widget.dart';
import '../../app/app_actions.dart';
import '../../app/app_state.dart';

class QuizConnector extends StatelessWidget {
  final GlobalKey<ScaffoldState> _quizGlobalKey = GlobalKey();

  QuizConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, QuizViewModel>(
      distinct: true,
      // onInit: (store) => store.dispatch(HomePrepareDataAction()),
      converter: (store) {
        return QuizViewModel(
          isLoading: store.state.dataStatus == DataStatus.inProgress,
          // homeBodyProps: _mapToHomeBodyProps(store),
          questionsProps: [],
          quizResultsProps: QuizResultsPageProps(0, [], () {}),
          bottomNavigationBarProps: _mapToBarProps(store),
        );
      },
      builder: (context, viewModel) => QuizScreen(
        viewModel,
        _quizGlobalKey,
      ),
    );
  }

  HomeBodyProps _mapToHomeBodyProps(Store<AppState> store) {
    final infoModel = store.state.homeState.info;
    return HomeBodyProps(
      infoModel?.synopsis ?? '',
      infoModel?.yearsAired ?? '',
      infoModel?.creators.map((e) => e.name).toList() ?? [],
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
