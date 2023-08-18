import 'package:drive_test_pal/features/quiz/ui/quiz.dart';
import 'package:flutter/material.dart';

class QuestionTextWidget extends StatelessWidget {
  const QuestionTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            quizBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}