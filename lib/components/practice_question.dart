import 'package:drive_test_pal/widgets/questions_cat_list.dart';

class PracticeQuestion{
  final QuestionType questionType;
  final String questionText;
  final int questionAnswer;
  final List<String> options;

  PracticeQuestion(this.questionType, this.questionText, this.questionAnswer, this.options);
}