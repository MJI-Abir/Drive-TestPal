import 'package:drive_test_pal/features/question_category/bloc/question_category_bloc.dart';
import 'package:drive_test_pal/features/question_category/models/question_category_model.dart';
import 'package:drive_test_pal/practice_question_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:drive_test_pal/constants/constants.dart';

PracticeQuestionBrain practiceQuestionBrain = PracticeQuestionBrain();

class QuestionCatTile extends StatelessWidget {
  final QuestionCategoryModel questionCategoryModel;
  final QuestionCategoryBloc questionCategoryBloc;
  const QuestionCatTile({
    super.key, 
    required this.questionCategoryBloc,
    required this.questionCategoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: ListTileTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
        contentPadding: const EdgeInsets.all(5),
        iconColor: Colors.white,
        textColor: Colors.white,
        tileColor: kActiveCardColor,
        style: ListTileStyle.list,
        dense: true,
        child: Card(
          elevation: 6,
          // margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(FontAwesomeIcons.addressBook)),
            title: Text(
                  questionCategoryModel.title,
                  style: kQuestionCatTitleStyle,
                ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                Text(
                  'Total: ${questionCategoryModel.total}, Not Attempted: ${questionCategoryModel.notAttempted}',
                  style: kQuestionCatSubTitleStyle,
                ),
                Text(
                  'Incorrect: ${questionCategoryModel.total - questionCategoryModel.correct}, Correct: ${questionCategoryModel.correct}',
                  style: kQuestionCatSubTitleStyle,
                ),
                kDividerStyle,
                const SizedBox(height: 10),
              ],
            ),
            onTap: () {
              questionCategoryBloc.add(QuestionCategorySelectedEvent(selectedQuestionType: questionCategoryModel.questionType));
            },
          ),
        ),
      ),
    );
  }
}
