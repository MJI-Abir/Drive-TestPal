import 'package:drive_test_pal/core/utils/app_routes.dart';
import 'package:drive_test_pal/core/utils/constants.dart';
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
      theme: ThemeData.light().copyWith(
        primaryColor: kAppThemeColor,
        scaffoldBackgroundColor: kAppThemeColor,
      ),
      initialRoute: AppRoutes.bottomNavBar,
      routes: AppRoutes.routes,
    );
  }
}
