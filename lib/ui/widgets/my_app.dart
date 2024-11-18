import 'package:flutter/material.dart';
import 'package:flutter_ped_di/factories/di_container.dart';
import 'package:flutter_ped_di/ui/widgets/example_view_model.dart';
import 'package:flutter_ped_di/ui/widgets/example_widget.dart';
import 'package:provider/provider.dart';

abstract class MainNavigation {
  Map<String, Widget Function(BuildContext)> makeRoutes();
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {

  final mainNavigation = ServiceLocator.instance.mainNavigation; // [2]
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ExampleWidgetModel>( // внедряем ExampleCalcViewModel как абстрактный класс ExampleWidgetModel. ExampleCalcViewModel - реализация абстрактного класса теперь. 
      create: (_) => ExampleCalcViewModel(), // 1. регистрируем зависимость вьюМодели в дереве 
      // create: (_) => ExamplePetViewModel(), // все равно будет работать
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: mainNavigation.makeRoutes(),
        onGenerateRoute: mainNavigation.onGenerateRoute,
      ),
    );
  }
}
