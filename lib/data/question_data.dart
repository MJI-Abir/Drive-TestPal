import '../components/practice_question.dart';
import '../enums/enum.dart';

int countQuestionsByType(
    List<PracticeQuestion> questionBank, QuestionTypeEnum type) {
  return questionBank.where((question) => question.questionType == type).length;
}

class QuestionData {
  final int numberOfAllQuestions = questionBank.length;

  final int numberOfAccidentsQuestions =
      countQuestionsByType(questionBank, QuestionTypeEnum.accidents);

  final int numberOfLightsQuestions =
      countQuestionsByType(questionBank, QuestionTypeEnum.lights);

  final int numberOfIntersectionQuestions =
      countQuestionsByType(questionBank, QuestionTypeEnum.intersection);

  final int numberOfLaneChangeQuestions =
      countQuestionsByType(questionBank, QuestionTypeEnum.laneChange);

  final int numberOfParkingQuestions =
      countQuestionsByType(questionBank, QuestionTypeEnum.parking);

  static final List<PracticeQuestion> questionBank = [
    PracticeQuestion(
        QuestionTypeEnum.accidents,
        'Collisions can happen more often when: ',
        3,
        ['a) option 111', 'b) option 112', 'c) option 113', 'd) option 114'],
        'hello here is the explanation for this question',
        DifficultyEnum.easy),
    PracticeQuestion(
        QuestionTypeEnum.accidents,
        'In emergency situations you should:',
        1,
        ['a) option 121', 'b) option 122', 'c) option 123', 'd) option 124'],
        'hello here is the explanation for this question',
        DifficultyEnum.medium),
    PracticeQuestion(
        QuestionTypeEnum.accidents,
        'Most work zone crashes:',
        3,
        ['a) option 131', 'b) option 132', 'c) option 133', 'd) option 134'],
        'hello here is the explanation for this question',
        DifficultyEnum.hard),
    PracticeQuestion(
        QuestionTypeEnum.accidents,
        'What is the first thing to do when you are involved in an accident where the other driver was injured',
        1,
        ['a) option 141', 'b) option 142', 'c) option 143', 'd) option 144'],
        'hello here is the explanation for this question',DifficultyEnum.easy),
    PracticeQuestion(
        QuestionTypeEnum.lights,
        'A flashing red light at an intersection means:',
        3,
        ['a) option 211', 'b) option 212', 'c) option 213', 'd) option 214'],
        'hello here is the explanation for this question',DifficultyEnum.medium),
    PracticeQuestion(
        QuestionTypeEnum.lights,
        'A flashing yellow light means:',
        1,
        ['a) option 221', 'b) option 222', 'c) option 223', 'd) option 224'],
        'hello here is the explanation for this question',DifficultyEnum.hard),
    PracticeQuestion(
        QuestionTypeEnum.intersection,
        'this is an intersection category question',
        2,
        ['a) option 311', 'b) option 312', 'c) option 313', 'd) option 314'],
        'hello here is the explanation for this question',DifficultyEnum.easy),
    PracticeQuestion(
        QuestionTypeEnum.intersection,
        'What should you do if you want to turn left when the oncoming traffic is heavy?',
        3,
        ['a) option 321 ', 'b) option 322', 'c) option 323', 'd) option 324'],
        'hello here is the explanation for this question',DifficultyEnum.medium),
    PracticeQuestion(
        QuestionTypeEnum.intersection,
        'What should you do if you want to turn left on a green light?',
        2,
        ['a) option 331', 'b) option 332', 'c) option 333', 'd) option 334'],
        'hello here is the explanation for this question',DifficultyEnum.hard),
    PracticeQuestion(
        QuestionTypeEnum.laneChange,
        'What does a solid yellow line next to a broken yellow line mean?',
        1,
        ['a) option 421', 'b) option 422', 'c) option 423', 'd) option 424'],
        'hello here is the explanation for this question',DifficultyEnum.easy),
    PracticeQuestion(
        QuestionTypeEnum.lights,
        'What does a traffic light with a red light and a green arrow mean?',
        4,
        ['a) option 231', 'b) option 232', 'c) option 233', 'd) option 234'],
        'hello here is the explanation for this question',DifficultyEnum.medium),
    PracticeQuestion(
        QuestionTypeEnum.laneChange,
        'After passing a car, you should return to the right lane when: ',
        1,
        ['a) option 411', 'b) option 412', 'c) option 413', 'd) option 414'],
        'hello here is the explanation for this question',DifficultyEnum.hard),
    PracticeQuestion(
        QuestionTypeEnum.parking,
        'What does a "No Standing" sign mean?',
        4,
        ['a) option 511', 'b) option 512', 'c) option 513', 'd) option 514'],
        'hello here is the explanation for this question',DifficultyEnum.medium),
    PracticeQuestion(
        QuestionTypeEnum.parking,
        'What does a "No Parking" sign mean?',
        1,
        ['a) option 521', 'b) option 522', 'c) option 523', 'd) option 524'],
        'hello here is the explanation for this question',DifficultyEnum.easy),
  ];
}
