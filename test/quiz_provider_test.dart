import 'package:flutter_test/flutter_test.dart';
import 'package:thrive_futurama/core/network/model/question.dart';
import 'package:thrive_futurama/providers/quiz_provider.dart';

void main() {
  group('QuizProvider', () {
    late QuizProvider quizProvider;

    setUp(() {
      quizProvider = QuizProvider();
    });

    test('setup() initializes _questions and _userAnswers', () {
      final questions = [
        Question(
          id: 1,
          question: 'What is the capital of France?',
          possibleAnswers: ['London', 'Paris', 'Berlin', 'Madrid'],
          correctAnswer: 'Paris',
        ),
        Question(
          id: 2,
          question: 'What is the largest country in the world?',
          possibleAnswers: ['Russia', 'Canada', 'China', 'USA'],
          correctAnswer: 'Russia',
        ),
      ];

      quizProvider.setup(questions);

      expect(quizProvider.numberOfQuestions, questions.length);
      expect(quizProvider.questionFor(0), questions[0]);
      expect(quizProvider.questionFor(1), questions[1]);
      expect(quizProvider.answerFor(0), null);
      expect(quizProvider.answerFor(1), null);
    });
    test('score should be 0 if no questions answered', () {
      quizProvider.setup([
        Question(
          id: 1,
          question: 'What is the capital of France?',
          possibleAnswers: ['Paris', 'London', 'Madrid', 'Berlin'],
          correctAnswer: 'Paris',
        ),
        Question(
          id: 2,
          question: 'What is the currency of Japan?',
          possibleAnswers: ['Dollar', 'Peso', 'Yen', 'Euro'],
          correctAnswer: 'Yen',
        ),
      ]);

      expect(quizProvider.score, 0);
    });

    test('score should be 1 if one question answered correctly', () {
      quizProvider.setup([
        Question(
          id: 1,
          question: 'What is the capital of France?',
          possibleAnswers: ['Paris', 'London', 'Madrid', 'Berlin'],
          correctAnswer: 'Paris',
        ),
        Question(
          id: 2,
          question: 'What is the currency of Japan?',
          possibleAnswers: ['Dollar', 'Peso', 'Yen', 'Euro'],
          correctAnswer: 'Yen',
        ),
      ]);

      quizProvider.selectAnswer('Paris');
      expect(quizProvider.score, 1);
    });
    test('nextQuestion() updates currentQuestionIndex', () {
      final questions = [
        Question(
          id: 1,
          question: 'What is the capital of France?',
          possibleAnswers: ['London', 'Paris', 'Berlin', 'Madrid'],
          correctAnswer: 'Paris',
        ),
        Question(
          id: 2,
          question: 'What is the largest country in the world?',
          possibleAnswers: ['Russia', 'Canada', 'China', 'USA'],
          correctAnswer: 'Russia',
        ),
      ];

      quizProvider.setup(questions);

      expect(quizProvider.currentQuestionIndex, 0);

      quizProvider.nextQuestion();

      expect(quizProvider.currentQuestionIndex, 1);
    });

    test('selectAnswer() updates _userAnswers', () {
      final questions = [
        Question(
          id: 1,
          question: 'What is the capital of France?',
          possibleAnswers: ['London', 'Paris', 'Berlin', 'Madrid'],
          correctAnswer: 'Paris',
        ),
      ];

      quizProvider.setup(questions);

      expect(quizProvider.answerFor(0), null);

      quizProvider.selectAnswer('Paris');

      expect(quizProvider.answerFor(0), 'Paris');
    });

    test('reset() sets currentQuestionIndex and _userAnswers to initial state',
        () {
      final questions = [
        Question(
          id: 1,
          question: 'What is the capital of France?',
          possibleAnswers: ['London', 'Paris', 'Berlin', 'Madrid'],
          correctAnswer: 'Paris',
        ),
      ];

      quizProvider.setup(questions);

      quizProvider.selectAnswer('Paris');

      expect(quizProvider.currentQuestionIndex, 0);
      expect(quizProvider.answerFor(0), 'Paris');

      quizProvider.reset();

      expect(quizProvider.currentQuestionIndex, 0);
      expect(quizProvider.answerFor(0), null);
    });
  });

  group('QuizProvider negative scenarios:', () {
    final question1 = Question(
      id: 1,
      question: 'What is the capital of France?',
      possibleAnswers: ['London', 'Paris', 'Berlin', 'Madrid'],
      correctAnswer: 'Paris',
    );

    final question2 = Question(
      id: 2,
      question: 'What is the largest planet in the Solar System?',
      possibleAnswers: ['Jupiter', 'Saturn', 'Mars', 'Venus'],
      correctAnswer: 'Jupiter',
    );

    test('setup should not override existing questions and user answers', () {
      final provider = QuizProvider();
      provider.setup([question1, question2]);

      provider.selectAnswer('Paris');
      provider.nextQuestion();

      provider.setup([question2, question1]);

      expect(provider.currentQuestionIndex, equals(1));
      expect(provider.questionFor(0), equals(question1));
      expect(provider.answerFor(0), equals('Paris'));
      expect(provider.numberOfQuestions, equals(2));
    });

    test('nextQuestion should not go beyond the last question', () {
      final provider = QuizProvider();
      provider.setup([question1]);

      provider.nextQuestion();
      provider.nextQuestion();

      expect(provider.currentQuestionIndex, equals(0));
    });

    test('qestionFor should return null for out of bounds index', () {
      final provider = QuizProvider();
      provider.setup([question1]);

      expect(provider.questionFor(1), isNull);
      expect(provider.questionFor(-1), isNull);
    });

    test('answerFor should return null for out of bounds index', () {
      final provider = QuizProvider();
      provider.setup([question1]);

      expect(provider.answerFor(1), isNull);
      expect(provider.answerFor(-1), isNull);
    });

    test('isCorrectAnswerFor should return false for out of bounds question',
        () {
      final provider = QuizProvider();
      provider.setup([question1]);

      final question = Question(
        id: 999,
        question: 'What is the largest animal on Earth?',
        possibleAnswers: ['Elephant', 'Blue whale', 'Giraffe', 'Hippopotamus'],
        correctAnswer: 'Blue whale',
      );

      expect(provider.isCorrectAnswerFor(question), isFalse);
    });
  });
}
