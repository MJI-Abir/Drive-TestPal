// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/quiz/bloc/quiz_bloc.dart';

import '../../question_category/ui/question_category_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});


  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late QuizBrain quizBrain;
  
  final QuizBloc quizBloc = QuizBloc();

  @override
  void initState() {
    quizBloc.add(QuizInitialEvent());
    super.initState();
  }

  int? correctOptionIndex;
  bool isContinueButtonVisible = true;

  void highlightSelectedAnswer() {
    final correctOption = practiceQuestionBrain.getCorrectOption();
    setState(() {
      correctOptionIndex = correctOption - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      bloc: quizBloc,
      listenWhen: (previous, current) => current is QuizActionState,
      buildWhen: (previous, current) => current is! QuizActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case QuizLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case QuizLoadingSuccessState:
          final successState = state as QuizLoadingSuccessState;
          quizBrain = QuizBrain(selectedQuestions: successState.selectedQuestions);
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //Question Text
                  buildQuestionText(),
                  //option 1
                  buildOptions(0),
                  //option 2
                  buildOptions(1),
                  //option 3
                  buildOptions(2),
                  //option 4
                  buildOptions(3),

                  if (isContinueButtonVisible) buildContinueButton(),
                ],
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  Expanded buildQuestionText(){
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

  Expanded buildOptions(int optionNumberIndex) {
    final isCorrectOption = correctOptionIndex == optionNumberIndex;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () {
            print('option $optionNumberIndex is clicked!');
            highlightSelectedAnswer();
          },
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: isCorrectOption ? Colors.green : Colors.transparent,
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
