import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Color color;
  final Widget cardChild;
  final VoidCallback? onPress;
  const ReusableCard(
      {required this.color,
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
          borderRadius: BorderRadius.circular(10.0),
          // boxShadow: widget.isHovered
          //     ? [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.2),
          //           spreadRadius: 2,
          //           blurRadius: 5,
          //           offset: const Offset(0, 2),
          //         ),
          //       ]
          //     : [],
        ),
        child: widget.cardChild,
      ),
    );
  }
}

// class ReusableCard extends statelessWidget {
//   ReusableCard(
//       {required this.color,
//       required this.cardChild,
//       required this.onPress,
//       required this.isHovered});

//   final Color color;
//   final Widget cardChild;
//   final Function onPress;
//   final bool isHovered;

//   @override
//   Widget build(BuildContext context) {
//     print(isHovered);
//     return MouseRegion(
//       child: GestureDetector(
//         onTap: onPress(),
//         child: Container(
//           padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
//           margin: const EdgeInsets.all(15.0),
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(10.0),
//             boxShadow: isHovered
//                 ? [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(0, 2),
//                     ),
//                   ]
//                 : [],
//           ),
//           child: cardChild,
//         ),
//       ),
//     );
//   }
// }
