import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {Key? key,
      required this.icon,
      required this.colour,
      required this.onPress})
      : super(key: key);

  final IconData icon;
  final Color colour;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: colour,
      ),
      onPressed: onPress,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4F4E60),
    );
  }
}
