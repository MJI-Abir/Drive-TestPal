
import '../utils/enum.dart';

class QuestionCategoryModel{
  final String title;
  final int total;
  final int notAttempted;
  final int correct;
  final QuestionTypeEnum questionType;
  const QuestionCategoryModel({
    required this.title,
    required this.total,
    required this.notAttempted,
    required this.correct,
    required this.questionType,}
  );
}