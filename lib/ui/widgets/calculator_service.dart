// import 'package:flutter_ped_di/factories/di_container.dart';
import 'package:flutter_ped_di/ui/widgets/summator.dart';
import 'package:get_it/get_it.dart';

enum CalculatorServiceOperation {summ}

class CalculatorService {
  final summator = GetIt.instance<Summator>();
  // final Summator summator = ServiceLocator.instance.makeSummator();
  CalculatorService();

  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
      }
    }
  }