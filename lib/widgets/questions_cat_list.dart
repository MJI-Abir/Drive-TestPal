import 'package:flutter/material.dart';
import 'package:drive_test_pal/enums/enum.dart';
import 'question_cat_tile.dart';

class QuestionsCatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemBuilder: (context, index){
    //     final questionCategory = 
    //   });
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      children: const <Widget>[
        QuestionCatTile('All questions', 250, 250, 0, QuestionType.allQuestions),
        QuestionCatTile('Accidents', 5, 5, 0, QuestionType.accidents),
        QuestionCatTile('Lights', 6, 6, 0, QuestionType.lights),
        QuestionCatTile('Intersection', 4, 4, 0, QuestionType.intersection),
      ],
    );
  }
}
