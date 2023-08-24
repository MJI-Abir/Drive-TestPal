import 'package:drive_test_pal/components/practice_question.dart';
import 'package:drive_test_pal/data/question_data.dart';

QuestionData questionData = QuestionData();

class QuizBrain {
  final List<PracticeQuestion> selectedQuestions;

  int _randomQuestionId = 0;
  int _score = 0;
  QuizBrain({required this.selectedQuestions});

  void nextQuestion() {
    if (_randomQuestionId < selectedQuestions.length) {
      _randomQuestionId++;
    }
  }

  String getQuestionText() {
    return selectedQuestions[_randomQuestionId].questionText;
  }

  List<String> getOptions() {
    return selectedQuestions[_randomQuestionId].options;
  }

  int getCorrectOptionIndex() {
    return selectedQuestions[_randomQuestionId].questionAnswer - 1;
  }

  int getQuestionId() {
    return _randomQuestionId + 1;
  }

  bool isQuizFinished() {
    return _randomQuestionId >= (selectedQuestions.length - 1) ? true : false;
  }

  void incrementScore() {
    _score++;
  }

  int getScore() {
    return _score;
  }

  String getExplanation() {
    return selectedQuestions[_randomQuestionId].explanation;
  }
}
