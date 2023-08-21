import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/quiz/bloc/quiz_bloc.dart';
import 'package:drive_test_pal/features/quiz/ui/quiz.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
    required this.isOptionSelected,
    required this.quizBloc,
    required this.optionNumberIndex,
    required this.state,
  });

  final bool isOptionSelected;
  final QuizBloc quizBloc;
  final int optionNumberIndex;
  final QuizState state;

  @override
  Widget build(BuildContext context) {
    final Color optionColor;
    if (state is QuizOptionSelectedActionState) {
      final optionSelectedState = state as QuizOptionSelectedActionState;

      optionColor = optionNumberIndex == quizBrain.getCorrectOptionIndex()
          ? Colors.green
          : (optionNumberIndex == optionSelectedState.selectedOptionIndex
              ? (optionSelectedState.isCorrectAnswer
                  ? Colors.green
                  : Colors.red)
              : kOptionDefaultColor);
    } else {
      optionColor = kOptionDefaultColor;
    }
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding - 5),
      child: Card(
        elevation: kDefaultElevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: isOptionSelected
              ? null
              : () {
                  quizBloc.add(QuizOptionSelectedEvent(
                      selectedOptionIndex: optionNumberIndex,
                      correctOptionIndex: quizBrain.getCorrectOptionIndex()));
                },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: optionColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              quizBrain.getOptions()[optionNumberIndex],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
