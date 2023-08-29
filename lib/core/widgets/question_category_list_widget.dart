import 'package:drive_test_pal/core/widgets/question_category_tile.dart';
import 'package:drive_test_pal/screens/question_category/presentation/blocs/question_category/question_category_bloc.dart';
import 'package:flutter/material.dart';

class QuestionCategoryListWidget extends StatelessWidget {
  const QuestionCategoryListWidget({
    super.key,
    required this.successState,
    required this.questionCategoryBloc,
  });

  final QCLoadingSuccessState successState;
  final QuestionCategoryBloc questionCategoryBloc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: successState.categories.length,
        itemBuilder: (context, index) {
          return QuestionCatTile(
              questionCategoryBloc: questionCategoryBloc,
              questionCategoryModel: successState.categories[index]);
        });
  }
}