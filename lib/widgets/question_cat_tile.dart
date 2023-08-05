import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:drive_test_pal/constants.dart';

class QuestionCatTile extends StatelessWidget {
  final String questionCatTileTitle;
  final int questionCatTileTotal;
  final int questionCatTileNotAttempted;
  final int questionCatTileCorrect;
  const QuestionCatTile(
    this.questionCatTileTitle,
    this.questionCatTileTotal,
    this.questionCatTileNotAttempted,
    this.questionCatTileCorrect,
  );

  int get questionCatTileInCorrect =>
      questionCatTileTotal - questionCatTileCorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: ListTileTheme(
        shape: const RoundedRectangleBorder(borderRadius: kBorderRadius),
        contentPadding: const EdgeInsets.all(5),
        iconColor: Colors.white,
        textColor: Colors.white,
        tileColor: Colors.black,
        style: ListTileStyle.list,
        dense: true,
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionCatTileTitle,
                style: kQuestionCatTitleStyle,
              ),
              const SizedBox(height: 10.0),
              Text(
                'Total: $questionCatTileTotal, Not Attempted: $questionCatTileNotAttempted',
                style: kQuestionCatSubTitleStyle,
              ),
              Text(
                'Incorrect: $questionCatTileInCorrect, Correct: $questionCatTileCorrect',
                style: kQuestionCatSubTitleStyle,
              ),
              kDividerStyle,
              const SizedBox(height: 10),
            ],
          ),
          leading: const Icon(FontAwesomeIcons.addressBook),
          onTap: (){
            Navigator.pushNamed(context, '/practiceScreen');
          },
        ),
      ),
    );
  }
}
