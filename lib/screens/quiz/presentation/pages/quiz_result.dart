import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/screens/quiz/presentation/blocs/quiz/quiz_bloc.dart';
import 'package:drive_test_pal/screens/quiz/presentation/pages/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({super.key});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  late ValueNotifier<double> quizScoreValueNotifier;

  @override
  void initState() {
    quizScoreValueNotifier = ValueNotifier(0);
    super.initState();
    calculateQuizScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleCircularProgressBar(
              size: 200,
              animationDuration: 2,
              valueNotifier: quizScoreValueNotifier,
              mergeMode: true,
              onGetText: (value) {
                return Text(
                  '${value.toInt()}%',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              progressColors: [Colors.green.withOpacity(0.5), Colors.green],
            ),
            kSizedBox,
            Text(
              'Correct: ${quizBrain.getScore()}',
              style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
            ),
            Text(
              'Incorrect: ${quizBloc.selectedQuestions.length - quizBrain.getScore()}',
              style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    quizScoreValueNotifier.dispose();
    super.dispose();
  }

  void calculateQuizScore() {
    double score =
        (quizBrain.getScore() / quizBloc.selectedQuestions.length) * 100;
    quizScoreValueNotifier.value = score;
  }
}
