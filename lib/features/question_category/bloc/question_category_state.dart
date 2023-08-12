part of 'question_category_bloc.dart';

@immutable
sealed class QuestionCategoryState {}

sealed class QuestionCategoryActionState extends QuestionCategoryState{}

class QuestionCategoryInitialState extends QuestionCategoryState {}

class QCLoadingState extends QuestionCategoryState{}

class QCErrorState extends QuestionCategoryState{}

class QCLoadingSuccessState extends QuestionCategoryState{
  final List<QuestionCategoryModel> categories;

  QCLoadingSuccessState({required this.categories});

}

class QCNavigateToPracticeQuestionScreenActionState extends QuestionCategoryActionState{
    final QuestionType selectedQuestionType;

  QCNavigateToPracticeQuestionScreenActionState({required this.selectedQuestionType});
}

// class QCCategorySelectedActionState extends QuestionCategoryActionState{
//   final QuestionType questionType;

//   QCCategorySelectedActionState({required this.questionType});
// }