import 'package:drive_test_pal/enums/enum.dart';

class QuestionTypeData{
  static List<Map<String, dynamic>> questionTypes = 
  [
    {
      'title' : 'All questions',
      'total' : 250,
      'notAttempted' : 250,
      'correct' : 0,
      'questionType' : QuestionType.allQuestions
    },
    {
      'title' : 'Accidents',
      'total' : 5,
      'notAttempted' : 5,
      'correct' : 0,
      'questionType' : QuestionType.accidents
    },
    {
      'title' : 'Lights',
      'total' : 6,
      'notAttempted' : 6,
      'correct' : 0,
      'questionType' : QuestionType.lights
    },
    {
      'title' : 'Intersection',
      'total' : 4,
      'notAttempted' : 4,
      'correct' : 0,
      'questionType' : QuestionType.intersection
    },
  ];
}