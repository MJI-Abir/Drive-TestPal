import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/home/widgets/quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCardListLayout extends StatelessWidget {
  const QuizCardListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: kDefaultPadding * 2, left: kDefaultPadding),
          child: Text(
            'EASY QUESTIONS',
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.only(bottom: kDefaultPadding * 2),
            child: const Row(
              children: [
                QuizCard(),
                QuizCard(),
                QuizCard(),
                QuizCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
