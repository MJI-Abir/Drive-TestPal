import 'package:drive_test_pal/features/home/ui/home.dart';
import 'package:drive_test_pal/features/practice_screen/ui/practice.dart';
import 'package:drive_test_pal/features/question_category/ui/question_category_screen.dart';
import 'package:drive_test_pal/features/quiz/ui/quiz.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String questionCategoryPage = '/questionCategory';
  static const String quizPage = '/quiz';
  static const String practicePage = '/practice';
  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => const Home(),
    questionCategoryPage: (context) => const QuestionCategoryScreen(),
    quizPage: (context) => const Quiz(),
    practicePage: (context) => const PracticeScreen(),
  };
}
