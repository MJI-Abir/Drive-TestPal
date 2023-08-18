import 'package:drive_test_pal/constants/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Color color;
  final Widget cardChild;
  final VoidCallback? onPress;
  const ReusableCard(
      {super.key, required this.color,
      required this.cardChild,
      required this.onPress});

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: kBorderRadius,
          boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kActiveCardColor.withOpacity(0.23),
                  ),
                ],
        ),
        child: widget.cardChild,
      ),
    );
  }
}