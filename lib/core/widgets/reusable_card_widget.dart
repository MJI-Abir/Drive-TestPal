import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:drive_test_pal/core/widgets/icon_content.dart';
import 'package:flutter/material.dart';

class ReusableCardWidget extends StatelessWidget {
  const ReusableCardWidget({
    super.key,
    required this.iconData,
    required this.cardLabel,
    required this.navigateTo,
    required this.context,
  });

  final IconData iconData;
  final String cardLabel;
  final String navigateTo;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, navigateTo),
          child: Card(
            elevation: kDefaultElevation,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius + 10.0)),
            child: Container(
                padding: const EdgeInsets.all(kDefaultPadding + 5.0),
                decoration: BoxDecoration(
                  color: kAppThemeColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(kBorderRadius + 10.0),
                ),
                child: IconContent(icon: iconData, label: cardLabel)),
          ),
        ),
      ),
    );
  }
}
