part of 'question_category_bloc.dart';

@immutable
sealed class QuestionCategoryEvent {}

class QuestionCategoryInitialEvent extends QuestionCategoryEvent{}



class QuestionCategorySelectedEvent extends QuestionCategoryEvent{
  final QuestionType selectedQuestionType;
  QuestionCategorySelectedEvent({ required this.selectedQuestionType});
}
