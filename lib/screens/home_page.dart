import 'package:drive_test_pal/components/icon_content.dart';
import 'package:drive_test_pal/components/reusable_card.dart';
import 'package:drive_test_pal/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DRIVE TEST PAL', style: kTitleTextStyle,),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.listCheck, label: 'Start test'),
                  onPress: () {},
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.book,
                    label: 'Flash Cards',
                  ),
                  onPress: () {},
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.circleInfo, label: 'Info'),
                  onPress: () {},
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.gear,
                    label: 'Settings',
                  ),
                  onPress: () {},
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.handHoldingDollar,
                      label: 'Upgrade'),
                  onPress: () {},
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.book,
                    label: 'Free Stuff',
                  ),
                  onPress: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
