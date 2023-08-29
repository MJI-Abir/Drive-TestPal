// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:drive_test_pal/core/utils/app_routes.dart';
import 'package:drive_test_pal/screens/quiz/presentation/blocs/quiz/quiz_bloc.dart';
import 'package:drive_test_pal/screens/quiz/presentation/widgets/loading_body.dart';
import 'package:drive_test_pal/screens/quiz/presentation/widgets/options_widget.dart';
import 'package:drive_test_pal/screens/quiz/presentation/widgets/question_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final QuizBloc quizBloc = QuizBloc();

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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
          // final materialBanner = MaterialBanner(
          //   forceActionsBelow: true,
          //   content: AwesomeSnackbarContent(
          //     title: 'OH NICE!!',
          //     message: 'You completed the quiz',
          //     contentType: ContentType.success,
          //     inMaterialBanner: true,
          //   ),
          //   actions: const [SizedBox.shrink()],
          // );
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentMaterialBanner()
          //   ..showMaterialBanner(materialBanner);
          final snackBar = SnackBar(
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              elevation: 0,
              backgroundColor: Colors.white,
              content: AwesomeSnackbarContent(
                  title: 'OH NICE!',
                  message: 'You completed the quiz',
                  contentType: ContentType.success));
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
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
            quizSize = quizBloc.selectedQuestions.length;
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
        body: Padding(
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
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Card(
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
                      children: <Widget>[
                        //don't use const here. the questionText won't change then.
                        // ignore: prefer_const_constructors
                        QuestionTextWidget(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildNextButton() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(kBorderRadius),
        ),
        color: kButtonColor,
      ),
      child: TextButton(
        onPressed: () {
          quizBloc.add(QuizContinueButtonClickedEvent());
        },
        child: const Text(
          'NEXT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
