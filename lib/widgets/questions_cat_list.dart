import 'package:flutter/material.dart';

import 'question_cat_tile.dart';

enum QuestionType{
  allQuestions,
  accidents,
  commonSigns,
  intersection,
}
class QuestionsCatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      children: const <Widget>[
        QuestionCatTile('All questions', 250, 250, 0),
        QuestionCatTile('Accidents', 5, 5, 0),
        QuestionCatTile('Common Signs', 6, 6, 0),
        QuestionCatTile('Intersection', 4, 4, 0),
      ],
    );
  }
}
