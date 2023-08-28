// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:drive_test_pal/core/data/question_type_data.dart';
import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/core/utils/enum.dart';
import 'package:drive_test_pal/screens/home/widgets/home_quiz_card.dart';

class QuizCardScrollView extends StatelessWidget {
  final DifficultyEnum difficulty;
  const QuizCardScrollView({
    Key? key,
    required this.difficulty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Row(
        children: List.generate(
          (questionData.numberOfAllQuestions / 5).ceil(),
          (index) => Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding * 2),
            child: HomeQuizCard(
              index: index + 1,
              imageUrl: 'assets/images/easy${index+1}.jpg',
              difficulty: difficulty,
            ),
          ),
        ),
      ),
    );
  }
}
