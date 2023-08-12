import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/question_category/ui/question_category_screen.dart';
import 'package:drive_test_pal/features/quiz/ui/quiz.dart';
import 'package:flutter/material.dart';
import 'features/home/ui/home.dart';

void main() {
  runApp(const DriveTestPal());
}

class DriveTestPal extends StatelessWidget {
  const DriveTestPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kAppThemeColor,
        scaffoldBackgroundColor: kAppThemeColor,
      ),
      initialRoute: '/',
      routes: {
        '/' :(context) => const Home(),
        '/questionCatScreen' :(context) => const QuestionCategoryScreen(),
        '/quiz' : (context) => const Quiz(),
      },
    );
  }
}
