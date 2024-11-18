import 'package:flutter/material.dart';
import 'package:flutter_ped_di/main_navigation.dart';
import 'package:flutter_ped_di/ui/widgets/calculator_service.dart';
import 'package:flutter_ped_di/ui/widgets/example_view_model.dart';
import 'package:flutter_ped_di/ui/widgets/example_widget.dart';
import 'package:flutter_ped_di/main.dart';
import 'package:flutter_ped_di/ui/widgets/my_app.dart';
import 'package:flutter_ped_di/ui/widgets/summator.dart';

MainDIContainer makeDIContainer() => _DIContainer();

class _DIContainer implements MainDIContainer, ScreenFactory {
  late final MainNavigationDefault _mainNavigation;
  Summator _makeSummator() => Summator();
  CalculatorService _makeCalculatorService() => CalculatorService(_makeSummator());
  ExampleWidgetModel _makeExampleWidgetModel() => ExampleCalcViewModel(_makeCalculatorService());
  @override
  Widget makeExampleScreen() => ExampleWidget(model: _makeExampleWidgetModel());
  @override
  Widget makeApp() => MyApp(mainNavigation: _mainNavigation);

  _DIContainer(){
    _mainNavigation = MainNavigationDefault(this);
  }
}


