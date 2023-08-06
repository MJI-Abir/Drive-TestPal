import 'package:drive_test_pal/practice_question_brain.dart';
import 'package:drive_test_pal/widgets/questions_cat_list.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:drive_test_pal/constants.dart';

PracticeQuestionBrain practiceQuestionBrain = PracticeQuestionBrain();

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

    final questionType = ModalRoute.of(context)?.settings.arguments as QuestionType;
    practiceQuestionBrain.setQuestionType(questionType);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Question Text
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  practiceQuestionBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          //option 1
          buildOptions(0),

          //option 2
          buildOptions(1),

          //option 3
          buildOptions(2),

          //option 4
          buildOptions(3),

          //show Answer button
          Padding(
            padding: kButtonPadding,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                highlightCorrectAnswer();
              },
              child: const Text(
                'Show Answer',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),

          //next question button
          Padding(
            padding: kButtonPadding,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
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
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
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
          ),
        ],
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
