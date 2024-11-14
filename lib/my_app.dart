import 'package:flutter/material.dart';
import 'package:flutter_ped_di/example_view_model.dart';
import 'package:flutter_ped_di/example_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleWidget(model: ExamplePetViewModel(),), // 3. Внедрить абстрактный класс ExampleWidgetModel мы не
      // можем, поэтому внедряем ExamplePetViewModel или ExampleCalcViewModel.
    );
  }
}
