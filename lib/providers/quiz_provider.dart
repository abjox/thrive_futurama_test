import 'package:flutter/material.dart';

import '../core/network/model/question.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _questions = [];
  List<String?> _userAnswers = [];
  int currentQuestionIndex = 0;

  QuizProvider();

  bool get isLastQuestion => currentQuestionIndex == _questions.length - 1;

  int get score => _questions
      .asMap()
      .entries
      .where((entry) => entry.value.correctAnswer == _userAnswers[entry.key])
      .length;

  int get numberOfQuestions => _questions.length;

  void setup(List<Question> questions) {
    if (currentQuestionIndex > 0) return;
    _questions = questions;
    _userAnswers = List.filled(questions.length, null);
  }

  void nextQuestion() {
    if (currentQuestionIndex < _questions.length - 1) {
      currentQuestionIndex++;
      notifyListeners();
    }
  }

  void selectAnswer(String answer) {
    _userAnswers[currentQuestionIndex] = answer;

    notifyListeners();
  }

  void reset() {
    currentQuestionIndex = 0;
    _userAnswers.fillRange(0, _userAnswers.length, null);
    notifyListeners();
  }

  Question? qestionFor(int index) {
    if (index < _questions.length) {
      return _questions[index];
    }

    return null;
  }

  String? answerFor(int index) {
    if (index < _userAnswers.length) {
      return _userAnswers[index];
    }

    return null;
  }

  bool isCorrectAnswerFor(Question? question) {
    if (question == null) return false;
    final questionIndex = _questions.indexOf(question);
    final userAnswer = _userAnswers[questionIndex];

    return question.correctAnswer == userAnswer;
  }
}
