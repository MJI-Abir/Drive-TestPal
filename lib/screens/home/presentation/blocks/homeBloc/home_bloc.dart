import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_test_pal/core/data/question_data.dart';
import 'package:drive_test_pal/core/widgets/practice_question.dart';
import 'package:drive_test_pal/screens/home/widgets/home_quiz_card.dart';
import 'package:drive_test_pal/screens/quiz/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

QuizBrain quizBrain = QuizBrain(selectedQuestions: QuestionData.questionBank);

class HomeBloc extends Bloc<HomeEvent, HomeState> {

List<PracticeQuestion> selectedQuestions = [];

  HomeBloc() : super(HomeInitial()) {
    on<HomeCardClickedEvent>(homeCardClickedEvent);
  }

  FutureOr<void> homeCardClickedEvent(
      HomeCardClickedEvent event, Emitter<HomeState> emit) {
    selectedQuestions = QuestionData.questionBank
        .where((question) =>
            question.difficultyEnum == event.clickedCard.difficulty)
        .toList();
    quizBrain = QuizBrain(selectedQuestions: selectedQuestions);
    quizBrain.setDifficulty(event.clickedCard.difficulty);
    emit(HomeCardSelectedState());
  }
}
