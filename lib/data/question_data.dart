
import '../components/practice_question.dart';
import '../enums/enum.dart';

class QuestionData{
  static final List<PracticeQuestion>questionBank = [
    PracticeQuestion(
        QuestionType.accidents,
        'Collisions can happen more often when: ',
        3,
        ['a) option 111', 'b) option 112', 'c) option 113', 'd) option 114']),
    PracticeQuestion(
        QuestionType.accidents,
        'In emergency situations you should:',
        1,
        ['a) option 121', 'b) option 122', 'c) option 123', 'd) option 124']),
    PracticeQuestion(QuestionType.accidents, 'Most work zone crashes:', 3,
        ['a) option 131', 'b) option 132', 'c) option 133', 'd) option 134']),
    PracticeQuestion(
        QuestionType.accidents,
        'What is the first thing to do when you are involved in an accident where the other driver was injured',
        1,
        ['a) option 141', 'b) option 142', 'c) option 143', 'd) option 144']),
    PracticeQuestion(
        QuestionType.lights,
        'A flashing red light at an intersection means:',
        3, [
      'a) option 211',
      'b) option 212',
      'c) option 213',
      'd) option 214'
    ]),
    PracticeQuestion(
        QuestionType.lights,
        'A flashing yellow light means:',
        1, [
      'a) option 221',
      'b) option 222',
      'c) option 223',
      'd) option 224'
    ]),
    PracticeQuestion(QuestionType.intersection, 'Second Category Question', 2,
        ['a) option 311', 'b) option 312', 'c) option 313', 'd) option 314']),
  ];
}