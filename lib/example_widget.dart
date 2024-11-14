import 'package:flutter/material.dart';
import 'package:flutter_ped_di/example_view_model.dart';

enum ExampleWidgetModel {
  calc, pet
}

class ExampleWidget extends StatelessWidget {
  final ExampleWidgetModel mode;
  final calcModel = const ExampleCalcViewModel();
  final petModel = const ExamplePetViewModel();
  const ExampleWidget({super.key, required this.mode});

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
                mode == ExampleWidgetModel.calc ? calcModel.onPressMe() : petModel.onPressMe();
              },
            ),
            // ElevatedButton(
            //   child: const Text('Жми меня 2'),
            //   onPressed: () {
            //     modelOne.onPressMeTwo();
            //   },
            // ),
          ]
        ),
      ),
    );
  }
}
