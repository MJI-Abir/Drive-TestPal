import 'package:flutter/material.dart';

import '../widgets/questions_cat_list.dart';

class QuestionCategoryScreen extends StatelessWidget {
  const QuestionCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_sharp),
      ),
      body: QuestionsCatList(),
    );
  }
}



