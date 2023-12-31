import 'package:drive_test_pal/screens/practice_screen/widgets/options_widget.dart';
import 'package:drive_test_pal/screens/practice_screen/widgets/question_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:drive_test_pal/core/utils/constants.dart';

import '../../question_category/presentation/pages/question_category_screen.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int? correctOptionIndex;

  void highlightCorrectAnswer() {
    final correctOption = practiceQuestionBrain.getCorrectOption();
    setState(() {
      correctOptionIndex = correctOption - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Container(
            constraints: const BoxConstraints(minHeight: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white60),
            child: Column(
              children: <Widget>[
                //Question Text
                const QuestionTextWidget(),
    
                for (int i = 0;
                    i < practiceQuestionBrain.getOptions().length;
                    i++)
                  OptionsWidget(
                      correctOptionIndex: correctOptionIndex,
                      optionNumberIndex: i),
    
                //show Answer button
                buildShowAnswerButton(),
                //next question button
                buildNextQuestionButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildShowAnswerButton() {
    return Padding(
      padding: kButtonPadding,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
        ),
        onPressed: () {
          highlightCorrectAnswer();
        },
        child: const Text(
          'Show Answer',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  Padding buildNextQuestionButton(BuildContext context) {
    return Padding(
      padding: kButtonPadding,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
        ),
        child: const Text(
          'Next Question',
          style: TextStyle(color: Colors.black87),
        ),
        onPressed: () {
          setState(() {
            if (practiceQuestionBrain.isFinished()) {
              Alert(
                style: const AlertStyle(backgroundColor: kActiveCardColor),
                context: context,
                type: AlertType.info,
                title: "FINISHED!",
                desc: "You have reached the end of the quiz.",
                buttons: [
                  DialogButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    width: 120,
                    child: const Text(
                      "CONTINUE",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ).show();

              practiceQuestionBrain.reset();
            } else {
              practiceQuestionBrain.nextPracticeQuestion();
            }
            correctOptionIndex = null;
          });
        },
      ),
    );
  }
}
