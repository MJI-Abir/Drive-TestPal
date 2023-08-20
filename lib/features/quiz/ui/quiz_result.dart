import 'package:drive_test_pal/features/quiz/ui/quiz.dart';
import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Your Score is: ${quizBrain.getScore()}')),
    );
  }
}