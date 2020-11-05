import 'package:flutter/cupertino.dart';
import 'dart:math';

class Calculation {
  Calculation({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your BMI result is quite high. You should do some exercise.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good Job mate!';
    } else {
      return 'Your BMI result is lower than normal. You should eat more!';
    }
  }
}
