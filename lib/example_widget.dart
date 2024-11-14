import 'package:flutter/material.dart';

// 1. Добавили абстрактный класс
abstract class ExampleWidgetModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  final ExampleWidgetModel model;
  // final calcModel = const ExampleCalcViewModel();
  // final petModel = const ExamplePetViewModel();
  const ExampleWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Внедрение зависимостей'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Жми меня'),
              onPressed: () {
                model.onPressMe();
              },
            ),
            ElevatedButton(
              child: const Text('Жми меня 2'),
              onPressed: () {
                model.onPressMe2();
              },
            ),
          ]
        ),
      ),
    );
  }
}

// мы можем не знать, сколько у нас может быть моделей.
// итог коммита: нам теперь не нужно тянуть все модели. Появился абстрактный класс с перечислением методов модели, что 
// уменьшило код в верстке (нету ифов). Также нету модов (хотя все ещё в my_app передается модель ручками)
// ExampleWidget перестал зависеть от моделей напрямую, + они перестали создаваться внутри виджета, 
// теперь они приходят через конструктор. 
// Схематично поменялись стрелочки (из видео 101 урок) - IoC - Inversion of Control
// my_app.dart теперь внедряет example_view_model в конструктор ExampleWidget - внедрение зависимости.
