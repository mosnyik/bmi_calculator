import 'dart:math';

class BMICalculator {
  BMICalculator({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a hiegher than normal body weight. Try to do some more exercise, avoid junck and fatty foods';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. You take good care of your body and it is good, keep up the good work';
    } else {
      return 'You have a lower than normal body weight. It is advisable to eat more, think less and surround yourself with fun people';
    }
  }
}
