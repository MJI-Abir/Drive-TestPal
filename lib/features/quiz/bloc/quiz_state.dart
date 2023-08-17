// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

sealed class QuizActionState extends QuizState{}

final class QuizInitialState extends QuizState {}

class QuizLoadingState extends QuizState{}

class QuizLoadingSuccessState extends QuizState {
  final List<PracticeQuestion> selectedQuestions;
  QuizLoadingSuccessState({
    required this.selectedQuestions,
  });
}

class QuizErrorState extends QuizState{

}

class QuizOptionSelectedActionState extends QuizActionState {
  final int selectedOptionIndex;
  final bool isCorrectAnswer;
  QuizOptionSelectedActionState({
    required this.selectedOptionIndex,
    required this.isCorrectAnswer,
  });
}

class QuizCorrectAnswerAndExplanationDisplayedActionState extends QuizActionState{}

class QuizGoToNextQuizActionState extends QuizActionState{}

