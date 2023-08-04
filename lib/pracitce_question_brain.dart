import 'package:drive_test_pal/components/practice_question.dart';
import 'package:drive_test_pal/components/practice_question_options.dart';

class PracticeQuestionBrain{
  int _questionId = 0;

  final List<PracticeQuestion> _practiceQuestionBank = [
    PracticeQuestion(0, 'Collisions can happen more often when: ', 3),
    PracticeQuestion(1, 'In emergency situations you should:', 1),
    PracticeQuestion(2, 'Most work zone crashes:', 3),
    PracticeQuestion(3, 'What is the first thing to do when you are involved in an accident where the other driver was injured', 1),
  ];

  final List<PracticeQuestionOptions> _practiceQuestionOptions = [
    PracticeQuestionOptions(0, ['a) option 11', 'b) option 12', 'c) option 13', 'd) option 14']),
    PracticeQuestionOptions(1, ['a) option 21', 'b) option 22', 'c) option 23', 'd) option 24']),
    PracticeQuestionOptions(2, ['a) option 31', 'b) option 32', 'c) option 33', 'd) option 34']),
    PracticeQuestionOptions(3, ['a) option 41', 'b) option 42', 'c) option 43', 'd) option 44']),
  ];

  void nextPracticeQuestion(){
    if(_questionId < _practiceQuestionBank.length - 1){
      _questionId++;
    }
  }

  String getQuestionText(){
    return _practiceQuestionBank[_questionId].questionText;
  }

  List <String> getOptions(){
    return _practiceQuestionOptions[_questionId].options;
  }

  int getCorrectOption(){
    return _practiceQuestionBank[_questionId].questionAnswer;
  }

  bool isFinished(){
    if(_questionId >= _practiceQuestionBank.length - 1){
      return true;
    }
    else{
      return false;
    }
  }

  void reset(){
    _questionId = -1;
  }

}