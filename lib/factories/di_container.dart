import 'package:flutter/material.dart';
import 'package:flutter_ped_di/main.dart';
import 'package:flutter_ped_di/main_navigation.dart';
import 'package:flutter_ped_di/ui/widgets/calculator_service.dart';
import 'package:flutter_ped_di/ui/widgets/example_view_model.dart';
import 'package:flutter_ped_di/ui/widgets/example_widget.dart';
import 'package:flutter_ped_di/ui/widgets/my_app.dart';
import 'package:flutter_ped_di/ui/widgets/summator.dart';
import 'package:get_it/get_it.dart';

// В getIt зависимости нужно регистрировать, ранее мы сами ручками их описывали.
// перепишем последовательно все старые зависимости. Для 
void setupGetIt() {
  // [3] *следующая строчка* :
  GetIt.instance.registerSingleton<ScreenFactory>(const ScreenFactoryDefault());
  GetIt.instance.registerSingleton<MainNavigation>(MainNavigationDefault()); // регистрируем MainNavigationDefault, но по идее у него должен быть тип MainNavigation, 
                                                                             // приложение не должно ничего знать про MainNavigationDefault
  GetIt.instance.registerFactory<Summator>(() => const Summator());
 
   // 4.4
  GetIt.instance.registerSingleton<AppFactory>(const AppFactoryDefault()); // почему-то в видосе он эту зависимость положил выше

  GetIt.instance.registerFactory<CalculatorService>(() => CalculatorService());
  GetIt.instance.registerFactory<ExampleWidgetModel>(() => ExampleCalcViewModel());
  // makeExampleScreen и makeApp оба типа Widget, код ниже - ошибка, так делать нельзя
  // GetIt.instance.registerFactory<Widget>(() => ExampleWidget());
  // GetIt.instance.registerFactory<Widget>(() => MyApp());
  // обойти это тоже нельзя, поэтому создаем фабрику. --> [1]
  // ...
  // 4.1 Для myApp аналогично делаем абстрактный класс в main.dart


}

// --------------------------------------------------  Старый код  -------------------------------------------------------------
// class ServiceLocator {
//   static final instance = ServiceLocator._();
//   ServiceLocator._();
//   final MainNavigation mainNavigation = MainNavigationDefault(); //! mainNavigation - это синглтон
//   Summator makeSummator() => const Summator();
//   CalculatorService makeCalculatorService() => CalculatorService();
//   ExampleWidgetModel makeExampleWidgetModel() => ExampleCalcViewModel();
//   Widget makeExampleScreen() => ExampleWidget();
//   Widget makeApp() => MyApp(); //! MyApp зависит от mainNavigation (в di_container.dart этого явно не видно). MyApp тоже синглтон
// }
// ---------------------------------------------------------------------------------------------------------------------------


// [2]:
class ScreenFactoryDefault implements ScreenFactory {
  const ScreenFactoryDefault();
  @override
  Widget makeExampleScreen() => ExampleWidget();
} // .. тогда мы можем зарегистрировать ScreenFactory, которая будет создавать эти виджеты --> [3]. Она должна быть синглтоном и должна регистрироваться до mainNavigator,
// потому что будет к нему обращаться


// 4.3
class AppFactoryDefault implements AppFactory {
  const AppFactoryDefault();
  @override
  Widget makeApp() => MyApp();
}

