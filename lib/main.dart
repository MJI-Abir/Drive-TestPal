import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const DriveTestPal());
}

class DriveTestPal extends StatelessWidget {
  const DriveTestPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF262135),
        scaffoldBackgroundColor: Color(0xFF262135),
      ),
      home: const HomePage(),
    );
  }
}
