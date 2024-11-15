import 'package:flutter_ped_di/summator.dart';

enum CalculatorServiceOperation {summ}

class CalculatorService {
  final Summator summator;
  const CalculatorService(this.summator);

  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
      }
    }
  }