import 'package:drive_test_pal/features/home/widgets/reusable_card_widget.dart';
import 'package:drive_test_pal/config/routes/app_routes.dart';
import 'package:drive_test_pal/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        // centerTitle: true,
        title: const Text(
          'DRIVE TEST PAL',
          style: kTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ReusableCardWidget(
                    iconData: FontAwesomeIcons.listCheck,
                    cardLabel: 'Start Test',
                    navigateTo: AppRoutes.quizPage,
                    context: context),
                ReusableCardWidget(
                    iconData: FontAwesomeIcons.book,
                    cardLabel: 'Flash Cards',
                    navigateTo: AppRoutes.questionCategoryPage,
                    context: context),
              ],
            ),
            Row(
              children: <Widget>[
                ReusableCardWidget(
                    iconData: FontAwesomeIcons.circleInfo,
                    cardLabel: 'Info',
                    navigateTo: '/',
                    context: context),
                ReusableCardWidget(
                    iconData: FontAwesomeIcons.gear,
                    cardLabel: 'Settings',
                    navigateTo: '/',
                    context: context),
              ],
            ),
            Row(
              children: <Widget>[
                ReusableCardWidget(
                    iconData: FontAwesomeIcons.handHoldingDollar,
                    cardLabel: 'Upgrade',
                    navigateTo: '/',
                    context: context),
                ReusableCardWidget(
                    iconData: FontAwesomeIcons.book,
                    cardLabel: 'Free Stuff',
                    navigateTo: '/',
                    context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}