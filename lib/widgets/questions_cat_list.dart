import 'package:flutter/material.dart';

import 'question_cat_tile.dart';

class QuestionsCatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        QuestionCatTile(),
        QuestionCatTile(),
        QuestionCatTile(),
        QuestionCatTile(),
      ],
    );
  }
}