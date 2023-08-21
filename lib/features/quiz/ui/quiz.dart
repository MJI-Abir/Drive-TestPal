// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/config/routes/app_routes.dart';
import 'package:drive_test_pal/features/quiz/components/loading_body.dart';
import 'package:drive_test_pal/features/quiz/components/options_widget.dart';
import 'package:drive_test_pal/features/quiz/components/question_text_widget.dart';
import 'package:drive_test_pal/features/quiz/quiz_brain.dart';
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
      listener: (context, state) {
        if (state is QuizFinishedActionState) {
          Navigator.pushNamed(context, AppRoutes.quizResultPage);
        }
      },
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
            return buildQuizScreen(successState);

          case QuizOptionSelectedActionState:
            final quizOptionSelectedActionState =
                state as QuizOptionSelectedActionState;
            isOptionSelected = true;
            isContinueButtonVisible = true;
            //       final explanation = state.explanation;
            // final updatedScore = state.updatedScore;
            return buildQuizScreen(quizOptionSelectedActionState);

          case QuizGoToNextQuizActionState:
            final quizGoToNextQuizActionState =
                state as QuizGoToNextQuizActionState;
            isOptionSelected = false;
            isContinueButtonVisible = false;
            quizBrain.nextQuestion();
            return buildQuizScreen(quizGoToNextQuizActionState);
//TODO: problem
          default:
            return const SizedBox();
        }
      },
    );
  }

  SafeArea buildQuizScreen(QuizState quizState) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Container(
            constraints: const BoxConstraints(minHeight: 0, maxHeight: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white60,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const QuestionTextWidget(),
                for (int i = 0; i < quizBrain.getOptions().length; i++)
                  OptionsWidget(
                      isOptionSelected: isOptionSelected,
                      quizBloc: quizBloc,
                      optionNumberIndex: i,
                      state: quizState),
                if (quizState is QuizOptionSelectedActionState)
                  Text(quizState.explanation),
                if (isContinueButtonVisible) buildContinueButton(),
              ],
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
          quizBloc.add(QuizContinueButtonClickedEvent());
        },
        child: const Text(
          'Continue',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
