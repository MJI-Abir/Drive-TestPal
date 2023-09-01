import 'package:drive_test_pal/core/utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserCard({super.key});
  double profileHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      // color: Colors.red,
      child: Card(
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileImage(),
              const SizedBox(
                width: kDefaultPadding * 2,
              ),
              buildProfileInfo(),
              IconButton(
                alignment: Alignment.topRight,
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildProfileInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jawad Abir',
          style: kTitleTextStyleGoogle,
        ),
        kSmallSizedBox,
        Text(
          'Working at AmicSoft',
          style: kSubtitleTextStyleGoogle,
        ),
        kSmallSizedBox,
        Text(
          'Dhaka, Bangladesh',
          style: kSubtitleTextStyleGoogle,
        ),
      ],
    );
  }

  CircleAvatar buildProfileImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundImage: const AssetImage('${kImagePath}abir.jpg'),
    );
  }
}
