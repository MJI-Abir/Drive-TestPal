// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drive_test_pal/core/utils/enum.dart';
import 'package:drive_test_pal/screens/home/presentation/blocks/homeBloc/home_bloc.dart';
import 'package:drive_test_pal/screens/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:drive_test_pal/core/utils/constants.dart';

class HomeQuizCard extends StatelessWidget {
  const HomeQuizCard({
    Key? key,
    required this.index,
    required this.imageUrl,
    required this.numOfQuizes,
    required this.difficulty,
  }) : super(key: key);
  final int index;
  final String imageUrl;
  final int numOfQuizes;
  final DifficultyEnum difficulty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        // right: kDefaultPadding,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .50,
        // height: MediaQuery.of(context).size.height * .30,
        child: GestureDetector(
          onTap: () {
            homeBloc.add(
              HomeCardClickedEvent(this),
            );
          },
          child: Card(
            elevation: 5,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius * 2),
            ),
            clipBehavior: Clip.antiAlias,
            color: kAppThemeColor.withOpacity(0.8),
            child: Column(
              children: [
                Image(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.only(left: kDefaultPadding),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Practice Quiz $index',
                    style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        fontSize: 16,
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
                  child: Text(
                    '$numOfQuizes Quizes',
                    style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5 / 2,
                ),
                Container(
                  margin: const EdgeInsets.only(left: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'START LEARNING',
                        style: GoogleFonts.figtree(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.navigate_next_outlined,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
