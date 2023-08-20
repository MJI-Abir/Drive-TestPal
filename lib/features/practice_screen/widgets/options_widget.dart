import 'package:drive_test_pal/features/question_category/ui/question_category_screen.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
    required this.correctOptionIndex,
    required this.optionNumberIndex,
  });

  final int? correctOptionIndex;
  final int optionNumberIndex;

  @override
  Widget build(BuildContext context) {
    final isCorrectOption = correctOptionIndex == optionNumberIndex;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: isCorrectOption ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            practiceQuestionBrain.getOptions()[optionNumberIndex],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}