import 'package:flutter/material.dart';
// import 'package:flutter_ped_di/factories/di_container.dart';
import 'package:flutter_ped_di/ui/widgets/example_view_model.dart';
import 'package:flutter_ped_di/ui/widgets/example_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

abstract class MainNavigation {
  Map<String, Widget Function(BuildContext)> makeRoutes();
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {

  final mainNavigation = GetIt.instance<MainNavigation>();
  // final mainNavigation = ServiceLocator.instance.mainNavigation;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ExampleWidgetModel>(
      create: (_) => ExampleCalcViewModel(),
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
