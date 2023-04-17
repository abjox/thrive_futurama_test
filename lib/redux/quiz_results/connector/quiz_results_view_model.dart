import 'package:flutter/material.dart';

class QuizResultsViewModel {
  final VoidCallback onRestart;
  final VoidCallback onBack;

  QuizResultsViewModel({
    required this.onRestart,
    required this.onBack,
  });
}
