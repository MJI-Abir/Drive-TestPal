import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/quiz/ui/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionTextWidget extends StatelessWidget {
  const QuestionTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding) ,
      child: Text(
        quizBrain.getQuestionText(),
        textAlign: TextAlign.left,
        style: GoogleFonts.robotoMono(
          textStyle: kQuestionTextStyle,
        ),
      ),
    );
  }
}
