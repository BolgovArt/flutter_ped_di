import 'package:flutter/material.dart';
import 'package:flutter_ped_di/factories/di_container.dart';

// 2. Можно сделать так, чтобы DIContainer вообще нигде в приложении было не видно. Для этого сделаем его приватным в di_container.dart --> [1]
// А также создадим абстрактный класс тут, имплементируемся от него в --> [2]
abstract class MainDIContainer {
  Widget makeApp(); // берем последнее поле в _DIContainer
} 

// 1. можем создать один единственный DI сервис на всё приложение
// final diContainer = DIContainer();
// UPD после шага 2: теперь DI сервис создается через глобальную функцию
final diContainer = makeDIContainer();

void main() {
  final app = diContainer.makeApp();
  runApp(app);
}

// Итого main.dart зависит только от одной функции makeDIContainer(). Но какой контейнер он возвращает main.dart не знает

