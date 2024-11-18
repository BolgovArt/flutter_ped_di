import 'package:flutter/material.dart';

abstract class ExampleWidgetModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  final ExampleWidgetModel model;
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

