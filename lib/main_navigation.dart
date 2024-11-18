import 'package:flutter/material.dart';
import 'package:flutter_ped_di/factories/di_container.dart';
import 'package:flutter_ped_di/ui/widgets/my_app.dart';

class MainNavigationRouteNames {
  static const example = '/';
}


class MainNavigationDefault implements MainNavigation {
  const MainNavigationDefault();
  @override
  Map<String, Widget Function(BuildContext)> makeRoutes() => 
    <String, Widget Function(BuildContext)>{
      MainNavigationRouteNames.example: (_) => ServiceLocator.instance.makeExampleScreen()
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