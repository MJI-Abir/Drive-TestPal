import 'package:drive_test_pal/core/widgets/practice_question.dart';
import 'package:drive_test_pal/core/data/question_data.dart';

QuestionData questionData = QuestionData();

class QuizBrain {
  final List<PracticeQuestion> selectedQuestions;

  int _questionId = 0;
  int _score = 0;
  QuizBrain({required this.selectedQuestions});

  void nextQuestion() {
    if (_questionId < selectedQuestions.length) {
      _questionId++;
    }
  }

  String getQuestionText() {
    print('questionId from getQuestionText(): $_questionId');
    return selectedQuestions[_questionId].questionText;
  }

  List<String> getOptions() {
    print('questionId from getOptions(): $_questionId');
    return selectedQuestions[_questionId].options;
  }

  int getCorrectOptionIndex() {
    return selectedQuestions[_questionId].questionAnswer - 1;
  }

  int getQuestionId() {
    return _questionId + 1;
  }

  bool isQuizFinished() {
    return _questionId >= (selectedQuestions.length - 1) ? true : false;
  }

  void incrementScore() {
    _score++;
  }

  int getScore() {
    return _score;
  }

  void reset() {
    _questionId = 0;
  }

  String getExplanation() {
    return selectedQuestions[_questionId].explanation;
  }
}
