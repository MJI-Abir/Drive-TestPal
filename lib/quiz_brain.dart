// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:drive_test_pal/components/practice_question.dart';
import 'package:drive_test_pal/data/question_data.dart';

QuestionData questionData = QuestionData();

class QuizBrain {
  final List<PracticeQuestion> selectedQuestions;

  Random random = Random();
  int _randomQuestionId = 0;
  List<int> randomNumbers = [];
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

  // int getCorrectOption(){

  // }

  // bool isQuizFinished(){

  // }

  void generateRandomNumbers(){
    while (randomNumbers.length <= 10) {
      int randomQuestionIndex =
          random.nextInt(QuestionData.questionBank.length);
      randomNumbers.add(randomQuestionIndex);
    }
  }

}
