import 'package:drive_test_pal/data/question_data.dart';
import 'package:drive_test_pal/enums/enum.dart';

QuestionData questionData = QuestionData();

class QuestionTypeData {
  static List<Map<String, dynamic>> questionTypes = [
    {
      'title': 'All questions',
      'total': questionData.numberOfAllQuestions,
      'notAttempted': 250,
      'correct': 0,
      'questionType': QuestionTypeEnum.allQuestions
    },
    {
      'title': 'Accidents',
      'total': questionData.numberOfAccidentsQuestions,
      'notAttempted': 5,
      'correct': 0,
      'questionType': QuestionTypeEnum.accidents
    },
    {
      'title': 'Lights',
      'total': questionData.numberOfLightsQuestions,
      'notAttempted': 6,
      'correct': 0,
      'questionType': QuestionTypeEnum.lights
    },
    {
      'title': 'Intersection',
      'total': questionData.numberOfIntersectionQuestions,
      'notAttempted': 4,
      'correct': 0,
      'questionType': QuestionTypeEnum.intersection
    },
    {
      'title': 'Lane Change',
      'total': questionData.numberOfLaneChangeQuestions,
      'notAttempted': 4,
      'correct': 0,
      'questionType': QuestionTypeEnum.laneChange
    },
    {
      'title': 'Parking',
      'total': questionData.numberOfParkingQuestions,
      'notAttempted': 4,
      'correct': 0,
      'questionType': QuestionTypeEnum.parking
    },
  ];
}
