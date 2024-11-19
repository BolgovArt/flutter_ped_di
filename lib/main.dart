import 'package:flutter/material.dart';
import 'package:flutter_ped_di/factories/di_container.dart';
import 'package:get_it/get_it.dart';

abstract class AppFactory {
  Widget makeApp();
}

void main() async { // [1]
  setupGetIt();
  // засетапили ГетИт. Но перед тем как начать с ним работать
  WidgetsFlutterBinding.ensureInitialized(); // настройка для того, чтобы виджеты запускались ассинхронно
  await GetIt.instance.allReady(); // [1]. Ждем пока у нас все будет готово - вернется true, когда все ассинхронные инстансы засетапятся (строчки 1,2,3 в di_container.dart). После 
                                   // возвращения true мы переходим дальше и дальше остальная программа уже работает, строчки 1, 2, 3 уже проинициализированы
  final appFactory = GetIt.instance<AppFactory>();
  final app = appFactory.makeApp();
  runApp(app);
}


