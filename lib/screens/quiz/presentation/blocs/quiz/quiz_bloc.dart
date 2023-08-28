import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_test_pal/core/data/question_data.dart';
import 'package:drive_test_pal/core/utils/enum.dart';
import 'package:drive_test_pal/core/widgets/practice_question.dart';
import 'package:drive_test_pal/screens/quiz/quiz_brain.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

QuizBrain quizBrain = QuizBrain(selectedQuestions: QuestionData.questionBank);

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  List<PracticeQuestion> questions = [];
  List<PracticeQuestion> selectedQuestions = [];

  DifficultyEnum _difficulty = DifficultyEnum.easy;
  int _index = 0;

  set difficultyFromBloc(DifficultyEnum difficulty) {
    _difficulty = difficulty;
  }

  set indexFromBloc(int index) {
    _index = index*5;
  }

  QuizBloc() : super(QuizInitialState()) {
    on<QuizInitialEvent>(quizInitialEvent);
    on<QuizOptionSelectedEvent>(quizOptionSelectedEvent);
    on<QuizContinueButtonClickedEvent>(quizContinueButtonClickedEvent);
    on<QuizNextQuizButtonClickedEvent>(quizNextQuizButtonClickedEvent);
  }

  FutureOr<void> quizInitialEvent(
      QuizInitialEvent event, Emitter<QuizState> emit) async {
    emit(QuizLoadingState());
    questions = QuestionData.questionBank
        .where((question) => question.difficultyEnum == _difficulty)
        .toList();
    selectedQuestions = questions.sublist(_index,
        _index + 5 <= questions.length ? _index+5 : questions.length);
    quizBrain = QuizBrain(selectedQuestions: selectedQuestions);
    await Future.delayed(const Duration(seconds: 2));
    emit(QuizLoadingSuccessState());
  }

  FutureOr<void> quizOptionSelectedEvent(
      QuizOptionSelectedEvent event, Emitter<QuizState> emit) {
    final correctOptionIndex = quizBrain.getCorrectOptionIndex();
    final isCorrectAnswer = event.selectedOptionIndex == correctOptionIndex;
    if (isCorrectAnswer) quizBrain.incrementScore();
    emit(QuizOptionSelectedActionState(
        selectedOptionIndex: event.selectedOptionIndex,
        isCorrectAnswer: isCorrectAnswer,
        updatedScore: quizBrain.getScore(),
        explanation: quizBrain.getExplanation()));
  }

  FutureOr<void> quizContinueButtonClickedEvent(
      QuizContinueButtonClickedEvent event, Emitter<QuizState> emit) {
    if (quizBrain.isQuizFinished()) {
      emit(QuizFinishedActionState());
    } else {
      emit(QuizGoToNextQuizActionState());
    }
  }

  FutureOr<void> quizNextQuizButtonClickedEvent(
      QuizNextQuizButtonClickedEvent event, Emitter<QuizState> emit) {}
}
