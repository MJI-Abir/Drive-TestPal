import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../question_category/ui/question_category_screen.dart';

class QuestionTextWidget extends StatelessWidget {
  const QuestionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            practiceQuestionBrain.getQuestionText(),
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
