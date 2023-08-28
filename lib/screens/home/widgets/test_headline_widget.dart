import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TestHeadlineWidget extends StatelessWidget {
  const TestHeadlineWidget({
    Key? key,
    required this.difficulty,
  }) : super(key: key);
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kDefaultPadding * 2, left: kDefaultPadding),
      child: Text(
        difficulty,
        style: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}