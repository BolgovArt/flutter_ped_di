import 'package:flutter/material.dart';
import 'package:flutter_ped_di/main_navigation.dart';
import 'package:flutter_ped_di/ui/widgets/calculator_service.dart';
import 'package:flutter_ped_di/ui/widgets/example_view_model.dart';
import 'package:flutter_ped_di/ui/widgets/example_widget.dart';
import 'package:flutter_ped_di/ui/widgets/my_app.dart';
import 'package:flutter_ped_di/ui/widgets/summator.dart';



class ServiceLocator {
  static final instance = ServiceLocator._();
  ServiceLocator._();
  final MainNavigation mainNavigation = MainNavigationDefault();
  Summator makeSummator() => const Summator();
  CalculatorService makeCalculatorService() => CalculatorService();
  ExampleWidgetModel makeExampleWidgetModel() => ExampleCalcViewModel();
  Widget makeExampleScreen() => ExampleWidget();
  Widget makeApp() => MyApp(); // когда мы создаем MyApp, отсюда мы не видим что там внутри, но внутри мы сами берем зависимости через СервисЛокатор -> [2]
}

// Сервис локатор - класс, который предоставляет зависимости. DI container (не путать с термином DI - концепцией, паттерном) - это тоже класс. Они похожи, и тот и тот внутри себя
// создает зависимости. Разница в том, как их используют. (Один и тот же класс может быть и DI контейнером и СервисЛокатором одновременно, главное - это как его использовать).
// В случае сервисЛокатора внутри какого-нибудть класса (пусть ExampleCalcViewModel) модель сама достает из него зависимости. В случае DI из DIContainer мы ничего не достаем,
// мы внедряем, внедряют во ВьюМодэл. Это самая большая разница.


/* 

IoC - инверсия управления. Позволяет изменить направление зависимостей.

DI - внедрение зависимостей. Когда класс получает зависимость извне и не контролирует этот процесс

DI container - это класс, который создает зависимости и внедряет их
Плюсы: 
* Полная независимость классов.
* Ясность. При вызове или просмотре конструктора видно, что необходимо для работы класса.
* Позволяет использовать инверсию зависимостей (абстрактная модель abstract class ExampleWidgetModel { в example_widget_model.dart например)
* Можно расставлять const конструкторы

Service locator - это класс, который создает зависимости и используется для получения этих зависимостей.
Плюсы: 
* Меньше кода.
* Позволяет использовать инверсию зависимостей
бонус: позволяет уведомлять виджеты и ребилдить их
*/

// Provider - это тот же Service locator. Подробнее в п. 1 и 2 файлов my_app.dart и example_widget.dart.
// Инхериты и провайдер, который работает поверх инхеритов - это родной сервис локатор, встроенный в язык. Можно пользоваться и тем и тем, один из вариантов:
// Использовать DI для сервисов, репозиториев, доступов к данным, бизнес-логику. А потом во ViewModel с помощью Provider доставлять зависимости в экран (встроенный sl для UI).