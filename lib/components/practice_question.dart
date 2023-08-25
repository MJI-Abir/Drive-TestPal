// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../enums/enum.dart';

class PracticeQuestion {
  final QuestionTypeEnum questionType;
  final String questionText;
  final int questionAnswer;
  final List<String> options;
  final String explanation;
  final DifficultyEnum difficultyEnum;

  PracticeQuestion(
    this.questionType,
    this.questionText,
    this.questionAnswer,
    this.options,
    this.explanation,
    this.difficultyEnum,
  );
}
