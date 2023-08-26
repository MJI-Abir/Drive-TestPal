import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/screens/practice_screen/practice_question_brain.dart';
import 'package:drive_test_pal/screens/home/widgets/quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppThemeColor,
        title: Text(
          'DMV Acer',
          style: GoogleFonts.barriecito(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        primary: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            const SizedBox(
              height: 10,
            ),
            // Text('data'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Row(
                children: List.generate(
                  questionData.numberOfAllQuestions,
                  (index) => Container(
                    margin: const EdgeInsets.only(bottom: kDefaultPadding * 2),
                    child: QuizCard(
                      index: index + 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
