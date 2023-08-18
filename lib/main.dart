import 'package:drive_test_pal/config/routes/app_routes.dart';
import 'package:drive_test_pal/constants/constants.dart';
import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: AppRoutes.homePage,
      routes: AppRoutes.routes,
    );
  }
}
