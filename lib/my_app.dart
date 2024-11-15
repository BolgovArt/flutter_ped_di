import 'package:flutter/material.dart';
// import 'package:flutter_ped_di/example_view_model.dart';

class MyApp extends StatelessWidget {
  // final ExampleCalcViewModel viewModel;
  final Widget widget;

  // const MyApp({super.key, required this.viewModel});
  const MyApp({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ExampleWidget(model: ExamplePetViewModel(),),
      // home: ExampleWidget(model: viewModel),
      home: widget,
    );
  }
}
  // {
  //   final summator = Summator();
  //   calculatorService = CalculatorService(summator);
  // }