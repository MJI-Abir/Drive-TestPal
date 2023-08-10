import 'package:drive_test_pal/components/icon_content.dart';
import 'package:drive_test_pal/components/reusable_card.dart';
import 'package:drive_test_pal/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Expanded buildKey(IconData iconData, String cardLabel, String navigateTo, BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: kActiveCardColor,
        // color: _isHovered ? kActiveCardColor : kInactiveCardColor,
        cardChild: IconContent(icon: iconData, label: cardLabel),
        onPress: () {
          Navigator.pushNamed(context, navigateTo);
        },
        //TODO 1: Create a method "animateWhileHovering" to make an animation while hovering over the ReusableCard.
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
              buildKey(FontAwesomeIcons.listCheck, 'Start Test', '/', context),
              buildKey(FontAwesomeIcons.book, 'Flash Cards', '/questionCatScreen', context),
            ],
          ),
          Row(
            children: <Widget>[
              buildKey(FontAwesomeIcons.circleInfo, 'Info', '/', context),
              buildKey(FontAwesomeIcons.gear, 'Settings', '/', context),
            ],
          ),
          Row(
            children: <Widget>[
              buildKey(FontAwesomeIcons.handHoldingDollar, 'Upgrade', '/', context),
              buildKey(FontAwesomeIcons.book, 'Free Stuff', '/', context),
            ],
          ),
        ],
      ),
    );
  }
}
