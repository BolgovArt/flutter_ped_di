import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ExampleWidgetModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ExampleWidgetModel>();
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

