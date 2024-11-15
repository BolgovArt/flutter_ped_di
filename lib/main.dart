import 'package:flutter/material.dart';
import 'package:flutter_ped_di/calculator_service.dart';
import 'package:flutter_ped_di/example_view_model.dart';
import 'package:flutter_ped_di/my_app.dart';
import 'package:flutter_ped_di/summator.dart';
import 'example_widget.dart';

void main() {
  const summator = Summator();
  const calculatorService = CalculatorService(summator);
  const exampleCalcViewModel = ExampleCalcViewModel(calculatorService);
  const exampleWidget = ExampleWidget(model: exampleCalcViewModel);
  runApp(const MyApp(widget: exampleWidget));
}

// p.s. зависимость приходит теперь сверху, в случае чего мы можем ее подменить. Можно запихнуть другую модель (ExamplePetViewModel или какие-то тесты).
// Сборка отовсюду ушла: calculatorService не знает как собирать summator, он просто туда приходит. exampleCalcViewModel не знает как собирать calculatorService. exampleWidget
// не знает как собирается exampleCalcViewModel. MyApp не знает как собиарть exampleWidget, он также приходит сам.
// В main.dart все это хранить не очень хорошо, поэтому следующим коммитом все это переедет в файл di_container.dart
