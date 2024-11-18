import 'package:flutter/material.dart';
import 'package:flutter_ped_di/factories/di_container.dart';

abstract class MainDIContainer {
  Widget makeApp();
} 

final diContainer = makeDIContainer();

void main() {
  final app = diContainer.makeApp();
  runApp(app);
}


