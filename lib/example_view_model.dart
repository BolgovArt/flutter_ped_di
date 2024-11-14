import 'package:flutter_ped_di/calculator_service.dart';

class ExampleCalcViewModel {
  final calculatorService = const CalculatorService();
  const ExampleCalcViewModel();

  void onPressMe() {
    final result = calculatorService.calculate(1, 2, CalculatorServiceOperation.summ);
    print(result);
  }

  // void onPressMeTwo() {
  //   print('Гав');
  // }
}

class ExamplePetViewModel {
  const ExamplePetViewModel();
  
    void onPressMe() {
    print('Гав');
  }
}