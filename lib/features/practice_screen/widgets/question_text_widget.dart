import 'package:drive_test_pal/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../question_category/ui/question_category_screen.dart';

class QuestionTextWidget extends StatelessWidget {
  const QuestionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Text(
        practiceQuestionBrain.getQuestionText(),
        style: GoogleFonts.robotoMono(
          textStyle: kQuestionTextStyle,
        ),
      ),
    );
  }
}
