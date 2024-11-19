import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class MainNavigation {
  Map<String, Widget Function(BuildContext)> makeRoutes();
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {

  final mainNavigation = GetIt.instance<MainNavigation>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: mainNavigation.makeRoutes(),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
