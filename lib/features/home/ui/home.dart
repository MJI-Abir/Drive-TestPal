import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/home/widgets/quiz_card_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppThemeColor,
        title: Text(
          'DMV Acer',
          style: GoogleFonts.barriecito(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            QuizCardListLayout(),
          ],
        ),
      ),
    );
  }
}











            // Row(
            //   children: <Widget>[
            //     ReusableCardWidget(
            //         iconData: FontAwesomeIcons.listCheck,
            //         cardLabel: 'Start Test',
            //         navigateTo: AppRoutes.quizPage,
            //         context: context),
            //     ReusableCardWidget(
            //         iconData: FontAwesomeIcons.book,
            //         cardLabel: 'Flash Cards',
            //         navigateTo: AppRoutes.questionCategoryPage,
            //         context: context),
            //   ],
            // ),
            // Row(
            //   children: <Widget>[
            //     ReusableCardWidget(
            //         iconData: FontAwesomeIcons.circleInfo,
            //         cardLabel: 'Info',
            //         navigateTo: '/',
            //         context: context),
            //     ReusableCardWidget(
            //         iconData: FontAwesomeIcons.gear,
            //         cardLabel: 'Settings',
            //         navigateTo: '/',
            //         context: context),
            //   ],
            // ),
            // Row(
            //   children: <Widget>[
            //     ReusableCardWidget(
            //         iconData: FontAwesomeIcons.handHoldingDollar,
            //         cardLabel: 'Upgrade',
            //         navigateTo: '/',
            //         context: context),
            //     ReusableCardWidget(
            //         iconData: FontAwesomeIcons.book,
            //         cardLabel: 'Free Stuff',
            //         navigateTo: '/',
            //         context: context),
            //   ],
            // ),
            // Text('data'),
            // Text('hello from Bangladesh'),
            // Text('yo yo whats happeninere'),
            // Card(
            //   child: Column(
            //     children: <Widget> [
            //       Expanded(
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(50),
            //             image: const DecorationImage(
            //               image: AssetImage('assets/images/traffic1.jpg'),
            //               fit: BoxFit.fill,
            //             ),
            //           ),
            //         ),
            //       ),
            //       const Text('practice Test 1'),
            //     ],
            //   ),
            // ),