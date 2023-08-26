import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/screens/question_category/presentation/pages/question_category_screen.dart';
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
