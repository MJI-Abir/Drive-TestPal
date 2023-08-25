import 'package:drive_test_pal/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius*2),
          ),
          clipBehavior: Clip.antiAlias,
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
                  style: GoogleFonts.outfit(
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
                child: Text(
                  '120 Quizes',
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 12,
                    ),
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
                    style: GoogleFonts.figtree(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
