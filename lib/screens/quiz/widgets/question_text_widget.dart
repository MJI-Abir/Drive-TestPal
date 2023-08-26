import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/screens/quiz/presentation/page/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionTextWidget extends StatelessWidget {
  const QuestionTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      quizBrain.getQuestionText(),
      textAlign: TextAlign.left,
      style: GoogleFonts.robotoMono(
        textStyle: kQuestionTextStyle,
      ),
    );
  }
}
