import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_test_pal/core/data/question_type_data.dart';
import 'package:drive_test_pal/core/utils/enum.dart';
import 'package:drive_test_pal/screens/question_category/models/question_category_model.dart';
import 'package:drive_test_pal/screens/question_category/presentation/pages/question_category_screen.dart';
import 'package:meta/meta.dart';

part 'question_category_event.dart';
part 'question_category_state.dart';

class QuestionCategoryBloc
    extends Bloc<QuestionCategoryEvent, QuestionCategoryState> {
  QuestionCategoryBloc() : super(QuestionCategoryInitialState()) {
    //just saying, on this event, pass this state.
    on<QuestionCategoryInitialEvent>(questionCategoryInitialEvent);
    on<QuestionCategorySelectedEvent>(questionCategorySelectedEvent);
  }

  FutureOr<void> questionCategoryInitialEvent(
      QuestionCategoryInitialEvent event,
      Emitter<QuestionCategoryState> emit) async {
    emit(QCLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(
      QCLoadingSuccessState(
        categories: QuestionTypeData.questionTypes
            .map(
              (e) => QuestionCategoryModel(
                title: e['title'],
                total: e['total'],
                notAttempted: e['notAttempted'],
                correct: e['correct'],
                questionType: e['questionType'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> questionCategorySelectedEvent(
      QuestionCategorySelectedEvent event,
      Emitter<QuestionCategoryState> emit) {
    practiceQuestionBrain.reset();
    practiceQuestionBrain.setQuestionType(event.selectedQuestionType);
    emit(QCNavigateToPracticeQuestionScreenActionState());
  }
}
