import 'package:drive_test_pal/components/practice_question.dart';
import 'package:drive_test_pal/data/question_data.dart';

QuestionData questionData = QuestionData();

class QuizBrain {
  final List<PracticeQuestion> selectedQuestions;

  final int _randomQuestionId = 0;
  QuizBrain({
    required this.selectedQuestions
  });

  void nextRandomQuestion(){

  }

  String getQuestionText(){
    return selectedQuestions[_randomQuestionId].questionText;
  }

  List<String> getOptions(){
    return selectedQuestions[_randomQuestionId].options;
  }

  int getCorrectOptionIndex(){
    return selectedQuestions[_randomQuestionId].questionAnswer - 1;
  }

  // bool isQuizFinished(){

  // }

}
