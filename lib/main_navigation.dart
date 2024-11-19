import 'package:flutter/material.dart';
// import 'package:flutter_ped_di/factories/di_container.dart';
import 'package:flutter_ped_di/ui/widgets/my_app.dart';
import 'package:get_it/get_it.dart';

class MainNavigationRouteNames {
  static const example = '/';
}

// [1]:
abstract class ScreenFactory {
  Widget makeExampleScreen();
} // --> [2]

class MainNavigationDefault implements MainNavigation {
  final screenFactory = GetIt.instance<ScreenFactory>();
  MainNavigationDefault();
  @override
  Map<String, Widget Function(BuildContext)> makeRoutes() => 
    <String, Widget Function(BuildContext)>{
      MainNavigationRouteNames.example: (_) => screenFactory.makeExampleScreen()
      // MainNavigationRouteNames.example: (_) => ServiceLocator.instance.makeExampleScreen()
    };

   @override
     Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text('Navigation error');
        return MaterialPageRoute(builder: (_) => widget);
    }
   }
}