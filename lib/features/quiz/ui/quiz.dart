// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/features/quiz/components/loading_body.dart';
import 'package:drive_test_pal/features/quiz/components/options_widget.dart';
import 'package:drive_test_pal/features/quiz/components/question_text_widget.dart';
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
  bool isContinueButtonVisible = false;
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
              body: LoadingBody(),
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
                  const QuestionTextWidget(),

                  //Options
                  for (int i = 0; i < quizBrain.getOptions().length; i++)
                    OptionsWidget(isOptionSelected: isOptionSelected, quizBloc: quizBloc, optionNumberIndex: i, state: successState),

                  if (isContinueButtonVisible) buildContinueButton(),
                ],
              ),
            );

          case QuizOptionSelectedActionState:
            final quizOptionSelectedActionState =
                state as QuizOptionSelectedActionState;
            isOptionSelected = true;
            isContinueButtonVisible = true;

            //       final explanation = state.explanation;
            // final updatedScore = state.updatedScore;
            return Scaffold(
              // Build your entire screen with updated information
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const QuestionTextWidget(),
                  // Build your UI components with the updated information
                  // Text(explanation), // Display explanation
                  // Text("Score: $updatedScore"), // Display updated score

                  // Build options using the updated color
                  for (int i = 0; i < quizBrain.getOptions().length; i++)
                    OptionsWidget(isOptionSelected: isOptionSelected, quizBloc: quizBloc, optionNumberIndex: i, state: quizOptionSelectedActionState),

                  const SizedBox(height: 150),

                  if (isContinueButtonVisible) buildContinueButton(),

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

  Padding buildContinueButton() {
    return Padding(
      padding: kButtonPadding,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
        ),
        onPressed: () {
          setState(() {
            isOptionSelected = false;
            isContinueButtonVisible = false;
            quizBrain.nextQuestion();
          });
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




