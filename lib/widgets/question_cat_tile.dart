import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:drive_test_pal/constants.dart';

class QuestionCatTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(FontAwesomeIcons.addressBook),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Questions',
            style: kQuestionCatTitleStyle,
          ),
          SizedBox(height: 10.0),
          Text(
            'Total: 250, Not Attempted: 0',
            style: kQuestionCatSubTitleStyle,
          ),
          Text(
            'Incorrect: 0, Correct: 0',
            style: kQuestionCatSubTitleStyle,
          ),
        ],
      ),
      trailing: Checkbox(value: false, onChanged: (bool? value) {}),
    );
  }
}