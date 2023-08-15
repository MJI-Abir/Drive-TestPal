import 'package:drive_test_pal/features/practice_screen/widgets/question_text_widget.dart';
import 'package:drive_test_pal/features/question_category/bloc/question_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:drive_test_pal/constants/constants.dart';

import '../../question_category/ui/question_category_screen.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int? correctOptionIndex;
  final QuestionCategoryBloc questionCategoryBloc = QuestionCategoryBloc();

  void highlightCorrectAnswer() {
    final correctOption = practiceQuestionBrain.getCorrectOption();
    setState(() {
      correctOptionIndex = correctOption - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Question Text
          const QuestionTextWidget(),
          //option 1
          buildOptions(0),
          //option 2
          buildOptions(1),
          //option 3
          buildOptions(2),
          //option 4
          buildOptions(3),
          //show Answer button
          buildShowAnswerButton(),
          //next question button
          buildNextQuestionButton(context),
        ],
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
                    style:
                        const AlertStyle(backgroundColor: kActiveCardColor),
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
                  correctOptionIndex = null;
                  practiceQuestionBrain.nextPracticeQuestion();
                }
              });
            },
          ),
        );
  }

  Expanded buildOptions(int optionNumberIndex) {
    final isCorrectOption = correctOptionIndex == optionNumberIndex;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: isCorrectOption ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            practiceQuestionBrain.getOptions()[optionNumberIndex],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
