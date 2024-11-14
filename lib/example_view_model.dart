import 'package:flutter_ped_di/calculator_service.dart';
import 'package:flutter_ped_di/example_widget.dart';

class ExampleCalcViewModel implements ExampleWidgetModel{ // 2. Имплементируемся от модели
  final calculatorService = const CalculatorService();
  const ExampleCalcViewModel();

  void onPressMe() {
    final result = calculatorService.calculate(1, 2, CalculatorServiceOperation.summ);
    print(result);
  }

    void onPressMe2() {
    print(5);
  }

}

class ExamplePetViewModel implements ExampleWidgetModel{
  const ExamplePetViewModel();
  
    void onPressMe() {
    print('Гав');
  }

      void onPressMe2() {
    print('Мяу');
  }
}
