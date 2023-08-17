// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/quiz/bloc/quiz_bloc.dart';

late QuizBrain quizBrain;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final QuizBloc quizBloc = QuizBloc();

  @override
  void initState() {
    quizBloc.add(QuizInitialEvent());
    super.initState();
  }

  int? selectedOptionIndex;
  bool isCorrectAnswer = false;
  int? correctOptionIndex;
  bool isContinueButtonVisible = true;
  bool isOptionSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      bloc: quizBloc,
      // listenWhen: (previous, current) => current is QuizActionState,
      // buildWhen: (previous, current) => current is! QuizActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case QuizLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case QuizLoadingSuccessState:
            final successState = state as QuizLoadingSuccessState;
            quizBrain =
                QuizBrain(selectedQuestions: successState.selectedQuestions);
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //Question Text
                  buildQuestionText(),

                  //Options
                  for (int i = 0; i < quizBrain.getOptions().length; i++)
                    buildOptions(i, successState),

                  if (isContinueButtonVisible) buildContinueButton(),
                ],
              ),
            );

          case QuizOptionSelectedActionState:
            final quizOptionSelectedActionState =
                state as QuizOptionSelectedActionState;
            isOptionSelected = true;
            //       final explanation = state.explanation;
            // final updatedScore = state.updatedScore;

            return Scaffold(
              // Build your entire screen with updated information
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildQuestionText(),
                  // Build your UI components with the updated information
                  // Text(explanation), // Display explanation
                  // Text("Score: $updatedScore"), // Display updated score

                  // Build options using the updated color
                  for (int i = 0; i < quizBrain.getOptions().length; i++)
                    buildOptions(i, quizOptionSelectedActionState),

                  buildContinueButton(),

                  // Continue button or other UI components
                ],
              ),
            );
          default:
            return const SizedBox(
              child: Text('helllllllllo mammmmmmmaaaaaaaa. ami default'),
            );
        }
      },
    );
  }

  Expanded buildQuestionText() {
    return Expanded(
      flex: 4,
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

  Expanded buildOptions(int optionNumberIndex, QuizState state) {
    final Color optionColor;
    if (state is QuizOptionSelectedActionState) {
      optionColor = optionNumberIndex == state.selectedOptionIndex
          ? ((state).isCorrectAnswer ? Colors.green : Colors.red)
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
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: optionColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              quizBrain.getOptions()[optionNumberIndex],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildContinueButton() {
    return Padding(
      padding: kButtonPadding,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
        ),
        onPressed: () {
          print('Continue Button clicked!');
        },
        child: const Text(
          'Continue',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
