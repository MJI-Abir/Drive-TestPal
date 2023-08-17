import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:drive_test_pal/components/practice_question.dart';
import 'package:drive_test_pal/data/question_data.dart';
import 'package:drive_test_pal/features/quiz/ui/quiz.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  Random random = Random();
  QuizBloc() : super(QuizInitialState()) {
    on<QuizInitialEvent>(quizInitialEvent);
    on<QuizOptionSelectedEvent>(quizOptionSelectedEvent);
    on<QuizContinueButtonClickedEvent>(quizContinueButtonClickedEvent);
    on<QuizNextQuizButtonClickedEvent>(quizNextQuizButtonClickedEvent);
  }

  FutureOr<void> quizInitialEvent(
      QuizInitialEvent event, Emitter<QuizState> emit) async {
    emit(QuizLoadingState());
    //TODO: generate list of random practiceQuestions
    QuestionData.questionBank.shuffle();
    final selectedQuestions = QuestionData.questionBank.take(10).toList();
    await Future.delayed(const Duration(seconds: 2));
    emit(QuizLoadingSuccessState(selectedQuestions: selectedQuestions));
  }

  FutureOr<void> quizOptionSelectedEvent(
      QuizOptionSelectedEvent event, Emitter<QuizState> emit) {
    final correctOptionIndex = quizBrain.getCorrectOptionIndex();
    emit(QuizOptionSelectedActionState(
        selectedOptionIndex: event.selectedOptionIndex,
        isCorrectAnswer: event.selectedOptionIndex == correctOptionIndex));
  }

  FutureOr<void> quizContinueButtonClickedEvent(
      QuizContinueButtonClickedEvent event, Emitter<QuizState> emit) {}

  FutureOr<void> quizNextQuizButtonClickedEvent(
      QuizNextQuizButtonClickedEvent event, Emitter<QuizState> emit) {}
}
