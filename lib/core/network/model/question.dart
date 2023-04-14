import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final int id;
  final String question;
  final List<String> possibleAnswers;
  final String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
