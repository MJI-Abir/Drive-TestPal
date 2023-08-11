import 'package:drive_test_pal/features/question_category/bloc/bloc/question_category_bloc.dart';
import 'package:drive_test_pal/features/question_category/ui/question_cat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionCategoryScreen extends StatefulWidget {
  const QuestionCategoryScreen({super.key});

  @override
  State<QuestionCategoryScreen> createState() => _QuestionCategoryScreenState();
}

class _QuestionCategoryScreenState extends State<QuestionCategoryScreen> {
  final QuestionCategoryBloc questionCategoryBloc = QuestionCategoryBloc();

  @override
  void initState() {
    questionCategoryBloc.add(QuestionCategoryInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCategoryBloc, QuestionCategoryState>(
      bloc: questionCategoryBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case QCLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));

          case QCLoadingSuccessState:
            final successState = state as QCLoadingSuccessState;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_sharp),
              ),
              // body: QuestionsCatList(),
              body: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: successState.categories.length,
                  itemBuilder: (context, index) {
                    return QuestionCatTile(
                        questionCategoryBloc: questionCategoryBloc,
                        questionCategoryModel: successState.categories[index]);
                  }),
            );

          case QCErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
