import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: kBottomContainerColor,
        ),
        padding: const EdgeInsets.only(bottom: 30.0, top: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomContainerText,
          ),
        ),
      ),
    );
  }
}
