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
    print(isOptionSelected);
    final Color optionColor;
    if (state is QuizOptionSelectedActionState) {
      final optionSelectedState = state as QuizOptionSelectedActionState;
      optionColor = optionNumberIndex == optionSelectedState.selectedOptionIndex
          ? (optionSelectedState.isCorrectAnswer ? Colors.green : Colors.red)
          : Colors.transparent;
    } else {
      optionColor = Colors.transparent;
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: isOptionSelected
              ? null
              : () {
                  quizBloc.add(QuizOptionSelectedEvent(
                      selectedOptionIndex: optionNumberIndex,
                      correctOptionIndex: quizBrain.getCorrectOptionIndex()));
                },
          child: Card(
            elevation: 4,
            child: Container(
              // padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: optionColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizBrain.getOptions()[optionNumberIndex],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}