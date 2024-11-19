import 'package:flutter/material.dart';
import 'package:flutter_ped_di/main.dart';
import 'package:flutter_ped_di/main_navigation.dart';
import 'package:flutter_ped_di/ui/widgets/calculator_service.dart';
import 'package:flutter_ped_di/ui/widgets/example_view_model.dart';
import 'package:flutter_ped_di/ui/widgets/example_widget.dart';
import 'package:flutter_ped_di/ui/widgets/my_app.dart';
import 'package:flutter_ped_di/ui/widgets/summator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupGetIt() {
  // GetIt.instance.registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance); // добавлена ассинхронщина. 1 cпособ
  // GetIt.instance.registerLazySingleton<ScreenFactory>(() => ScreenFactoryDefault());
  // .. MainNavigationDefault ...
        //   GetIt.instance.registerSingleton<MainNavigation>(MainNavigationDefault());
        //   GetIt.instance.registerFactory<Summator>(() => const Summator());
        //   GetIt.instance.registerSingleton<AppFactory>(const AppFactoryDefault());
        //   GetIt.instance.registerFactory<CalculatorService>(() => CalculatorService());
        //   GetIt.instance.registerFactory<ExampleWidgetModel>(() => ExampleCalcViewModel());

//  2 способ с зависящими друг от друга синглтонами
  GetIt.instance.registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance); // 2 cпособ. Например нужен SharedPreferences на старте, но все в этой цепочке становится //! строчка 1.
              // ассинхронным, тк сам SharedPreferences ассинхронный и тянет за собой ScreenFactory и MainNavigation, которые должны быть синхронными. //! строчка 2.
              // На старте приложения сразу нужен будет MainNavigation (для основного виджета MyApp), но он ещё не будет готов. Для этого дополним код в main.dart [1] //! строчка 3.
  GetIt.instance.registerSingletonWithDependencies<ScreenFactory>(() => ScreenFactoryDefault(), dependsOn: [SharedPreferences]);
  GetIt.instance.registerSingletonWithDependencies<MainNavigation>(() => MainNavigationDefault(), dependsOn: [ScreenFactory]);
  GetIt.instance.registerFactory<Summator>(() => const Summator());
  GetIt.instance.registerFactory<AppFactory>(() => const AppFactoryDefault());
  GetIt.instance.registerFactory<CalculatorService>(() => CalculatorService());
  GetIt.instance.registerFactory<ExampleWidgetModel>(() => ExampleCalcViewModel());
}

// 1 способ ассинхронщины
// class ScreenFactoryDefault implements ScreenFactory {
//   ScreenFactoryDefault(){
//     setup(); 
//   }

//   Future<void> setup() async {
//     final storage = await GetIt.instance.getAsync<SharedPreferences>();
//     storage.setBool("key", true);
//   }

// 2 способ ассинхронщины
class ScreenFactoryDefault implements ScreenFactory {
  ScreenFactoryDefault(){
    setup();
  }

  Future<void> setup() async {
    final storage = await GetIt.instance<SharedPreferences>(); // p.s. нет .getAsync в сравнении с 1 способом
    storage.setBool("key", true);
  }


  @override
  Widget makeExampleScreen() => ExampleWidget();
} 

class AppFactoryDefault implements AppFactory {
  const AppFactoryDefault();
  @override
  Widget makeApp() => MyApp();
}