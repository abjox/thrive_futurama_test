import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/quiz_provider.dart';
import '../../redux/quiz/connector/quiz_view_model.dart';
import '../common/bottom_navigation_bar_widget.dart';
import '../common/futurama_error_widget.dart';
import 'components/quiz_body_widget.dart';

class QuizScreen extends StatelessWidget {
  final QuizViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const QuizScreen(
    this.viewModel,
    this.scaffoldKey, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Consumer<QuizProvider>(builder: (context, provider, child) {
        return Builder(builder: (context) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return FuturamaErrorWidget(
              viewModel.errorMessage!,
              viewModel.onReset,
            );
          }

          return QuizBodyWidget(
            provider.currentQuestionIndex,
            viewModel.onQuizResults,
          );
        });
      }),
      bottomNavigationBar: BottomNavigationBarWidget(
        viewModel.bottomNavigationBarProps,
      ),
    );
  }
}
