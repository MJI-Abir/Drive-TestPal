import 'package:drive_test_pal/constants/constants.dart';
import 'package:drive_test_pal/features/home/widgets/reusable_card_widget.dart';
import 'package:drive_test_pal/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppThemeColor,
        // centerTitle: true,
        title: Text(
          'DMV Acer',
          style: GoogleFonts.barriecito(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * 2),
              child: Text(
                'EASY',
              ),
            ),
            StartTestCard(),
          ],
        ),
      ),
    );
  }
}

class StartTestCard extends StatelessWidget {
  const StartTestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(kBorderRadius + 5.0),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: Card(
            elevation: 2,
            color: kAppThemeColor.withOpacity(0.8),
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/traffic1.jpg'),
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.only(left: kDefaultPadding),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Practice Quiz 1',
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5 / 2,
                ),
                Container(
                  margin: const EdgeInsets.only(left: kDefaultPadding),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '120 Quizes',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5 / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'START LEARNING',
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Icon(Icons.navigate_next_outlined),
                  ],
                )
              ],
            ),
          ),
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