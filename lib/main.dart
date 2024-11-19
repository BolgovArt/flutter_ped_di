import 'package:flutter/material.dart';
import 'package:flutter_ped_di/factories/di_container.dart';
import 'package:get_it/get_it.dart';

// 4.2
abstract class AppFactory {
  Widget makeApp();
}

void main() {
  // 5. При вызове setupGetIt(); все зависимости из di_container.dart регистрирует
  setupGetIt();
  final appFactory = GetIt.instance<AppFactory>();
  final app = appFactory.makeApp();
  runApp(app);
}


