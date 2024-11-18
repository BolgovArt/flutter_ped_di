import 'package:flutter/material.dart';
import 'package:flutter_ped_di/factories/di_container.dart';



void main() {
  final app = ServiceLocator.instance.makeApp();
  runApp(app);
}


