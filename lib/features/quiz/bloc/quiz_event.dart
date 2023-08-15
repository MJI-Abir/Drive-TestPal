part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class QuizInitialEvent extends QuizEvent{}

class QuizOptionSelectedEvent extends QuizEvent{}

class QuizContinueButtonClickedEvent extends QuizEvent{}

class QuizNextQuizButtonClickedEvent extends QuizEvent{}