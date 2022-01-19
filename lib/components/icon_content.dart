import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class ReusableCardChild extends StatelessWidget {
  const ReusableCardChild({
    Key? key,
    required this.myIcon,
    required this.cardLabel,
  }) : super(key: key);

  final IconData myIcon;
  final String cardLabel;
  // final  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcon,
          size: kIconSize,
          color: kActiveIconColor,
        ),
        kSpaceBtwnRows,
        Text(
          cardLabel,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
