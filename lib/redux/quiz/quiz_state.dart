import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../core/network/model/question.dart';

@immutable
class QuizState extends Equatable {
  final List<Question> questions;

  const QuizState({
    required this.questions,
  });

  factory QuizState.initial() {
    return const QuizState(
      questions: [],
    );
  }

  QuizState copyWith({
    List<Question>? questions,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object> get props => [
        questions,
      ];
}
