import 'package:drive_test_pal/core/utils/app_routes.dart';
import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/screens/practice_screen/practice_question_brain.dart';
import 'package:drive_test_pal/screens/question_category/presentation/blocs/question_category/question_category_bloc.dart';
import 'package:drive_test_pal/screens/question_category/widgets/question_category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final PracticeQuestionBrain practiceQuestionBrain = PracticeQuestionBrain();

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
      listenWhen: (previous, current) => current is QuestionCategoryActionState,
      buildWhen: (previous, current) => current is! QuestionCategoryActionState,
      listener: (context, state) {
        if (state is QCNavigateToPracticeQuestionScreenActionState) {
          Navigator.pushNamed(context, AppRoutes.practicePage);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case QCLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case QCLoadingSuccessState:
            final successState = state as QCLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kAppBarColor,
                // centerTitle: true,
                title: const Text(
                  
                  'Question categories',
                  style: kTitleTextStyle,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_sharp),
              ),
              body: QuestionCategoryListWidget(successState: successState, questionCategoryBloc: questionCategoryBloc),
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
