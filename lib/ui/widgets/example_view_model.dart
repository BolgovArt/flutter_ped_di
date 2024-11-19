import 'package:flutter_ped_di/ui/widgets/calculator_service.dart';
import 'package:flutter_ped_di/ui/widgets/example_widget.dart';
import 'package:get_it/get_it.dart';

class ExampleCalcViewModel implements ExampleWidgetModel{
  final calculatorService = GetIt.instance<CalculatorService>();

  ExampleCalcViewModel();

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
