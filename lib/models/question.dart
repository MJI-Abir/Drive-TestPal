import 'package:drive_test_pal/enums/enum.dart';

class Question{
  final String title;
  final int total;
  final int notAttempted;
  final QuestionType questionType;

  Question(this.title, this.total, this.notAttempted, this.questionType);
}
