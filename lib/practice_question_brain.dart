import 'package:drive_test_pal/components/practice_question.dart';
import 'package:drive_test_pal/data/question_data.dart';

import 'enums/enum.dart';

QuestionData questionData = QuestionData();
class PracticeQuestionBrain {
  int _questionId = 0;
  QuestionType _questionType = QuestionType.allQuestions;

  List<PracticeQuestion> getQuestionsWithCorrespondingQuestionType(
      QuestionType questionType) {
        return
        questionType == QuestionType.allQuestions? QuestionData.questionBank :QuestionData.questionBank
        .where((question) => question.questionType == _questionType)
        .toList();
  }

  void setQuestionType(QuestionType questionType) {
    _questionType = questionType;
  }

  void nextPracticeQuestion() {
    if (_questionId <
        getQuestionsWithCorrespondingQuestionType(_questionType).length - 1) {
      _questionId++;
    }
  }

  String getQuestionText() {
    print(_questionType);
    return getQuestionsWithCorrespondingQuestionType(_questionType)[_questionId]
        .questionText;
  }

  List<String> getOptions() {
    return getQuestionsWithCorrespondingQuestionType(_questionType)[_questionId]
        .options;
  }

  int getCorrectOption() {
    return getQuestionsWithCorrespondingQuestionType(_questionType)[_questionId]
        .questionAnswer;
  }

  bool isFinished() {
    if (_questionId >=
        getQuestionsWithCorrespondingQuestionType(_questionType).length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionId = 0;
  }
}
