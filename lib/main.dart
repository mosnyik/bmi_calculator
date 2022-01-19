import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kAppBckColor,
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      ),
      home: const InputPage(),
    );
  }
}
