import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drive_test_pal/data/question_type_data.dart';
import 'package:drive_test_pal/enums/enum.dart';
import 'package:drive_test_pal/features/question_category/models/question_category_model.dart';
import 'package:meta/meta.dart';

part 'question_category_event.dart';
part 'question_category_state.dart';

class QuestionCategoryBloc
    extends Bloc<QuestionCategoryEvent, QuestionCategoryState> {
  QuestionCategoryBloc() : super(QuestionCategoryInitial()) {
    //just saying, on this event, pass this state.
    on<QuestionCategoryInitialEvent>(questionCategoryInitialEvent);
    on<CategorySelectedEvent>(categorySelectedEvent);
  }

  FutureOr<void> questionCategoryInitialEvent(
      QuestionCategoryInitialEvent event,
      Emitter<QuestionCategoryState> emit) async {
    emit(QCLoadingState());
    await Future.delayed(const Duration(seconds: 3));
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

  FutureOr<void> categorySelectedEvent(
      CategorySelectedEvent event, Emitter<QuestionCategoryState> emit) {
    print(event.selectedQuestionType);
    emit(QCNavigateToPracticeQuestionScreenActionState());
  }
}
