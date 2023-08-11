part of 'question_category_bloc.dart';

@immutable
sealed class QuestionCategoryEvent {}

class QuestionCategoryInitialEvent extends QuestionCategoryEvent{}



class CategorySelectedEvent extends QuestionCategoryEvent{
  final QuestionType selectedQuestionType;
  CategorySelectedEvent({ required this.selectedQuestionType});
}
