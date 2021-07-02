import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  String getBMI() {
    double heightInMeters = height / 100;
    _bmi = weight / pow(heightInMeters, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getMessage() {
    if (_bmi >= 25) {
      return "You are overweight. Please start to control your diet and exercise.";
    } else if (_bmi > 18.5) {
      return "You are normal. You can continue with your diet.";
    } else {
      return "You are underweight. Please start to eat more.";
    }
  }
}
