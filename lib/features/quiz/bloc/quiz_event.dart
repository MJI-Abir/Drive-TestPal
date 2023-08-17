// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class QuizInitialEvent extends QuizEvent{}

class QuizOptionSelectedEvent extends QuizEvent {
  final int selectedOptionIndex;
  final int correctOptionIndex;
  QuizOptionSelectedEvent({
    required this.selectedOptionIndex,
    required this.correctOptionIndex,
  });
}

class QuizContinueButtonClickedEvent extends QuizEvent{}

class QuizNextQuizButtonClickedEvent extends QuizEvent{}