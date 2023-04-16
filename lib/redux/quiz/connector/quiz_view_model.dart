import 'package:flutter/material.dart';

import '../../../ui/common/bottom_navigation_bar_widget.dart';

class QuizViewModel {
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onReset;

  final VoidCallback onQuizResults;

  final BottomNavigationBarProps bottomNavigationBarProps;

  QuizViewModel({
    required this.isLoading,
    required this.errorMessage,
    required this.onReset,
    required this.onQuizResults,
    required this.bottomNavigationBarProps,
  });
}
