import 'package:flutter/material.dart';

import '../../question_category/ui/question_category_screen.dart';

class QuestionTextWidget extends StatelessWidget {
  const QuestionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                practiceQuestionBrain.getQuestionText(),
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