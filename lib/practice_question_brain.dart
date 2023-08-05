import 'package:drive_test_pal/components/practice_question.dart';

class PracticeQuestionBrain {
  int _questionId = 0;

  final List<PracticeQuestion> _practiceQuestionBank = [
    PracticeQuestion(0, 'Collisions can happen more often when: ', 3,
        ['a) option 111', 'b) option 112', 'c) option 113', 'd) option 114']),
    PracticeQuestion(1, 'In emergency situations you should:', 1,
        ['a) option 121', 'b) option 122', 'c) option 123', 'd) option 124']),
    PracticeQuestion(2, 'Most work zone crashes:', 3,
        ['a) option 131', 'b) option 132', 'c) option 133', 'd) option 134']),
    PracticeQuestion(
        3,
        'What is the first thing to do when you are involved in an accident where the other driver was injured',
        1,
        ['a) option 141', 'b) option 142', 'c) option 143', 'd) option 144']),
    PracticeQuestion(0, 'Second Category Question', 2,
        ['a) option 211', 'b) option 212', 'c) option 213', 'd) option 214']),
  ];

  // List<PracticeQuestion> getQuestionsWithCorrespondingQuestionTileId(int questionCatTileId){
  //   return _practiceQuestionBank.where((question) => question.questionCatTileId == questionCatTileId).toList();
  // }

  void nextPracticeQuestion() {
    if (_questionId < _practiceQuestionBank.length - 1) {
      _questionId++;
    }
  }

  String getQuestionText() {
    return _practiceQuestionBank[_questionId].questionText;
  }

  List<String> getOptions() {
    return _practiceQuestionBank[_questionId].options;
  }

  int getCorrectOption() {
    return _practiceQuestionBank[_questionId].questionAnswer;
  }

  bool isFinished() {
    if (_questionId >= _practiceQuestionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionId = -1;
  }
}
