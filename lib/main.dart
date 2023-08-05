import 'package:drive_test_pal/constants.dart';
import 'package:drive_test_pal/screens/practice_screen.dart';
import 'package:drive_test_pal/screens/question_category_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
        '/' :(context) => const HomeScreen(),
        '/questionCatScreen' :(context) => const QuestionCategoryScreen(),
        '/practiceScreen' : (context) => const PracticeScreen(),
      },
    );
  }
}
