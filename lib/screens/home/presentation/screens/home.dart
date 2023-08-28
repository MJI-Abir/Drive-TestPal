// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/core/utils/app_routes.dart';
import 'package:drive_test_pal/core/utils/enum.dart';
import 'package:drive_test_pal/screens/home/presentation/blocks/homeBloc/home_bloc.dart';
import 'package:drive_test_pal/screens/home/widgets/quiz_card_scroll_view.dart';
import 'package:drive_test_pal/screens/home/widgets/test_headline_widget.dart';
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
          body: const SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TestHeadlineWidget(
                  difficulty: 'Easy',
                ),
                SizedBox(
                  height: 10,
                ),
                QuizCardScrollView(
                  difficulty: DifficultyEnum.easy,
                ),
                TestHeadlineWidget(
                  difficulty: 'MEDIUM',
                ),
                SizedBox(
                  height: 10,
                ),
                QuizCardScrollView(
                  difficulty: DifficultyEnum.medium,
                ),
                TestHeadlineWidget(
                  difficulty: 'Hard',
                ),
                SizedBox(
                  height: 10,
                ),
                QuizCardScrollView(
                  difficulty: DifficultyEnum.hard,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
