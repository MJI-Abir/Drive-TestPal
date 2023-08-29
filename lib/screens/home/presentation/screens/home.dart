// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:drive_test_pal/core/data/question_data.dart';
import 'package:drive_test_pal/core/utils/app_routes.dart';
import 'package:drive_test_pal/core/utils/enum.dart';
import 'package:drive_test_pal/core/widgets/practice_question.dart';
import 'package:drive_test_pal/core/widgets/quiz_card_scroll_view.dart';
import 'package:drive_test_pal/core/widgets/test_headline_widget.dart';
import 'package:drive_test_pal/screens/home/presentation/blocks/homeBloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:drive_test_pal/core/utils/constants.dart';

final HomeBloc homeBloc = HomeBloc();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  void onTap(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  List<PracticeQuestion> easyQuestions = QuestionData.questionBank
      .where((question) => question.difficultyEnum == DifficultyEnum.easy)
      .toList();
  List<PracticeQuestion> mediumQuestions = QuestionData.questionBank
      .where((question) => question.difficultyEnum == DifficultyEnum.medium)
      .toList();
  List<PracticeQuestion> hardQuestions = QuestionData.questionBank
      .where((question) => question.difficultyEnum == DifficultyEnum.hard)
      .toList();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeCardSelectedState) {
          Navigator.pushNamed(context, AppRoutes.quizPage);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadingSuccessState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kAppThemeColor,
                title: Text(
                  'DMV Acer',
                  style: GoogleFonts.barriecito(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              floatingActionButton: const FloatingActionButton(
                onPressed: null,
                backgroundColor: kActiveColor,
                child: Icon(Icons.dark_mode),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                icons: kBottomNavIcons,
                backgroundColor: Colors.black87,
                inactiveColor: Colors.white,
                activeColor: kActiveColor,
                leftCornerRadius: 16,
                rightCornerRadius: 16,
                iconSize: 25,
                elevation: 6,
                gapLocation: GapLocation.center,
                activeIndex: activeIndex,
                notchSmoothness: NotchSmoothness.softEdge,
                onTap: onTap,
              ),
              body: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const TestHeadlineWidget(
                      difficulty: 'Easy',
                    ),
                    kSizedBox,
                    QuizCardScrollView(
                      difficulty: DifficultyEnum.easy,
                      questions: easyQuestions,
                    ),
                    const TestHeadlineWidget(
                      difficulty: 'MEDIUM',
                    ),
                    kSizedBox,
                    QuizCardScrollView(
                      difficulty: DifficultyEnum.medium,
                      questions: mediumQuestions,
                    ),
                    const TestHeadlineWidget(
                      difficulty: 'Hard',
                    ),
                    kSizedBox,
                    QuizCardScrollView(
                      difficulty: DifficultyEnum.hard,
                      questions: hardQuestions,
                    ),
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
