import 'package:drive_test_pal/bottom_nav_bar.dart';
import 'package:drive_test_pal/screens/home/presentation/screens/home.dart';
import 'package:drive_test_pal/screens/practice_screen/presentation/practice.dart';
import 'package:drive_test_pal/screens/question_category/presentation/pages/question_category_screen.dart';
import 'package:drive_test_pal/screens/quiz/presentation/pages/quiz.dart';
import 'package:drive_test_pal/screens/quiz/presentation/pages/quiz_result.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String bottomNavBar = '/bottomNavBar';
  static const String homePage = '/home';
  static const String questionCategoryPage = '/questionCategory';
  static const String quizPage = '/quiz';
  static const String practicePage = '/practice';
  static const String quizResultPage = '/quizResult';
  static Map<String, WidgetBuilder> routes = {
    bottomNavBar:(context) => const BottomNavBar(),
    homePage: (context) => const Home(),
    questionCategoryPage: (context) => const QuestionCategoryScreen(),
    quizPage: (context) => const Quiz(),
    practicePage: (context) => const PracticeScreen(),
    quizResultPage:(context) => const QuizResult(),
  };
}
