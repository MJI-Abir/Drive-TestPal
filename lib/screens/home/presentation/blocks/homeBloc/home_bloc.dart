import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_test_pal/screens/home/widgets/home_quiz_card.dart';
import 'package:drive_test_pal/screens/quiz/presentation/pages/quiz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCardClickedEvent>(homeCardClickedEvent);
  }

  FutureOr<void> homeCardClickedEvent(
      HomeCardClickedEvent event, Emitter<HomeState> emit) {
    quizBloc.difficultyFromBloc = event.clickedCard.difficulty;
    quizBloc.indexFromBloc = event.clickedCard.index - 1;
    emit(HomeCardSelectedState());
  }
}
