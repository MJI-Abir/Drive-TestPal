import 'package:drive_test_pal/constants/constants.dart';
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

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding - 5.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: isCorrectOption ? Colors.green : kOptionDefaultColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            practiceQuestionBrain.getOptions()[optionNumberIndex],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
