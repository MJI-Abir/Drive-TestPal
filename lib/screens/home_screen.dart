import 'package:drive_test_pal/components/icon_content.dart';
import 'package:drive_test_pal/components/reusable_card.dart';
import 'package:drive_test_pal/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool _isHovered = true;

  Expanded buildKey(IconData iconData, String cardLabel) {
    return Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        // color: _isHovered ? kActiveCardColor : kInactiveCardColor,
        cardChild: IconContent(icon: iconData, label: cardLabel),
        onPress: () {
          Navigator.pushNamed(context, '/first');
        },
        //TODO 2: Create a method "animateWhileHovering" to make an animation while hovering over the ReusableCard.
        // isHovered: _isHovered,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: const Text(
          'DRIVE TEST PAL',
          style: kTitleTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              buildKey(FontAwesomeIcons.listCheck, 'Start Test'),
              buildKey(FontAwesomeIcons.book, 'Flash Cards'),
            ],
          ),
          Row(
            children: <Widget>[
              buildKey(FontAwesomeIcons.circleInfo, 'Info'),
              buildKey(FontAwesomeIcons.gear, 'Settings'),
            ],
          ),
          Row(
            children: <Widget>[
              buildKey(FontAwesomeIcons.handHoldingDollar, 'Upgrade'),
              buildKey(FontAwesomeIcons.book, 'Free Stuff'),
            ],
          ),
        ],
      ),
    );
  }
}
