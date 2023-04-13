import 'package:flutter/material.dart';

class HomeViewModel {
  final bool isLoading;
  final bool isError;

  final String synopsis;
  final String yearsAired;
  final List<String> creators;

  final VoidCallback onCharacters;
  final VoidCallback onQuiz;

  HomeViewModel(
    this.isLoading,
    this.isError,
    this.synopsis,
    this.yearsAired,
    this.creators,
    this.onCharacters,
    this.onQuiz,
  );
}
