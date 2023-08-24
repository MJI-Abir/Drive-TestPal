// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/config/routes/app_routes.dart';
import 'package:drive_test_pal/features/quiz/widgets/loading_body.dart';
import 'package:drive_test_pal/features/quiz/widgets/options_widget.dart';
import 'package:drive_test_pal/features/quiz/widgets/question_text_widget.dart';
import 'package:drive_test_pal/features/quiz/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/quiz/bloc/quiz_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool isNextButtonVisible = false;
  bool isOptionSelected = false;
  int quizSize = 0;

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
            quizSize = successState.selectedQuestions.length;
            quizBrain =
                QuizBrain(selectedQuestions: successState.selectedQuestions);
            return buildQuizScreen(successState);

          case QuizOptionSelectedActionState:
            final quizOptionSelectedActionState =
                state as QuizOptionSelectedActionState;
            isOptionSelected = true;
            isNextButtonVisible = true;
            return buildQuizScreen(quizOptionSelectedActionState);

          case QuizGoToNextQuizActionState:
            final quizGoToNextQuizActionState =
                state as QuizGoToNextQuizActionState;
            isOptionSelected = false;
            isNextButtonVisible = false;
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
        appBar: AppBar(
          elevation: 1,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
            ),
          ),
          backgroundColor: kAppThemeColor,
          title: Text(
            'Practice Quiz',
            style: GoogleFonts.aBeeZee(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: Text(
                    '${quizBrain.getQuestionId()}/$quizSize',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Card(
                  elevation: kDefaultElevation,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    constraints: const BoxConstraints(minHeight: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kAppThemeColor.withOpacity(0.75),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const QuestionTextWidget(),
                        kDividerStyle,
                        for (int i = 0; i < quizBrain.getOptions().length; i++)
                          OptionsWidget(
                              isOptionSelected: isOptionSelected,
                              quizBloc: quizBloc,
                              optionNumberIndex: i,
                              state: quizState),
                        if (quizState is QuizOptionSelectedActionState)
                          Padding(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: Text(
                              quizState.explanation,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (isNextButtonVisible) buildNextButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildNextButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue[100],
      ),
      onPressed: () {
        quizBloc.add(QuizContinueButtonClickedEvent());
      },
      child: const Text(
        'NEXT',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
