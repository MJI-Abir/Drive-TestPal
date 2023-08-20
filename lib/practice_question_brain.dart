import 'package:drive_test_pal/components/practice_question.dart';
import 'package:drive_test_pal/data/question_data.dart';

import 'enums/enum.dart';

QuestionData questionData = QuestionData();

class PracticeQuestionBrain {
  int _questionId = 0;

  QuestionTypeEnum _questionType = QuestionTypeEnum.allQuestions;

  void setQuestionType(QuestionTypeEnum questionType) {
    _questionType = questionType;
  }

  List<PracticeQuestion> getQuestionsWithCorrespondingQuestionType(
      QuestionTypeEnum questionType) {
    return questionType == QuestionTypeEnum.allQuestions
        ? QuestionData.questionBank
        : QuestionData.questionBank
            .where((question) => question.questionType == _questionType)
            .toList();
  }

  void nextPracticeQuestion() {
    if (_questionId <
        getQuestionsWithCorrespondingQuestionType(_questionType).length - 1) {
      _questionId++;
    }
  }

  String getQuestionText() {
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
