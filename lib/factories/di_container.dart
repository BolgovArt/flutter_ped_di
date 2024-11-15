import 'package:flutter/material.dart';
import 'package:flutter_ped_di/calculator_service.dart';
import 'package:flutter_ped_di/example_view_model.dart';
import 'package:flutter_ped_di/example_widget.dart';
import 'package:flutter_ped_di/main.dart';
import 'package:flutter_ped_di/my_app.dart';
import 'package:flutter_ped_di/summator.dart';

// ------------------------------------------------------------------------------Часть 1--------------------------------------------------------------------------------------------
// class DIContainer {
//   late final Summator _summator;
//   CalculatorService _makeCalculatorService() => CalculatorService(_summator); // 2. а _makeCalculatorService эт функция, создающая CalculatorService на основе хранимого значения

//   // пусть сервис создается тогда, когда он непосредственно потребуется
//   // перечислять все поля как это сделано ниже не очень хорошо
//   // late final CalculatorService calculatorService;
//   // late final ExampleCalcViewModel exampleCalcViewModel;
//   // late final ExampleWidget exampleWidget;

//   DIContainer() {
//     _summator = Summator(); // 1. Сумматор создается в самом начале DIContainer. Это хранимое свойство, кто бы его не запросил (_makeCalculatorService и тд)

//   //   calculatorService = CalculatorService(summator);
//   //   exampleCalcViewModel = ExampleCalcViewModel(calculatorService);
//   //   exampleWidget = ExampleWidget(model: exampleCalcViewModel);
//   }
// }
// 3. хранить сумматор в данном примере не нужно, поэтому перепишем
// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


// [1]: к приватному _DIContainer допишем глобальную функцию makeDIContainer
MainDIContainer makeDIContainer() => _DIContainer();
class _DIContainer implements MainDIContainer{ // [2]
  Summator _makeSummator() => Summator();
  CalculatorService _makeCalculatorService() => CalculatorService(_makeSummator());
  ExampleWidgetModel _makeExampleWidgetModel() => ExampleCalcViewModel(_makeCalculatorService());
  Widget _makeExampleWidget() => ExampleWidget(model: _makeExampleWidgetModel());
  Widget makeApp() => MyApp(widget: _makeExampleWidget());

  _DIContainer();
}


