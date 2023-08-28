// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/core/widgets/practice_question.dart';
import 'package:flutter/material.dart';

import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/core/utils/enum.dart';
import 'package:drive_test_pal/screens/home/widgets/home_quiz_card.dart';

// ignore: must_be_immutable
class QuizCardScrollView extends StatelessWidget {
  final DifficultyEnum difficulty;
  final List<PracticeQuestion> questions;
  QuizCardScrollView({
    Key? key,
    required this.difficulty,
    required this.questions,
  }) : super(key: key);
  int j = 1;

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Row(
        children: List.generate(
          (questions.length / 5).ceil(),
          // (questionData.numberOfAllQuestions / 5).ceil(),
          (index) => Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding * 2),
            child: HomeQuizCard(
              index: i++,
              imageUrl: '$kImagePath${j++}.jpg',
              numOfQuizes:
                  i > (questions.length / 5).ceil() ? questions.length % 5 : 5,
              difficulty: difficulty,
            ),
          ),
        ),
      ),
    );
  }
}
