import 'package:flutter/material.dart';
import 'package:flutter_ped_di/ui/widgets/example_view_model.dart';
import 'package:get_it/get_it.dart';

abstract class ExampleWidgetModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = GetIt.instance<ExampleWidgetModel>();
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
            ElevatedButton(        // при нажатии кнопки приложение на ходу меняет модель 
              child: const Text('Жми меня 3'),
              onPressed: () {
                GetIt.instance.unregister<ExampleWidgetModel>();
                GetIt.instance.registerFactory<ExampleWidgetModel>(() => const ExamplePetViewModel());
              },
            ),
          ]
        ),
      ),
    );
  }
}

