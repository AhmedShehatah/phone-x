import 'package:flutter/material.dart';
import 'package:phone_x/app.dart';
import 'package:phone_x/core/di/di_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DIManager.initDI();
  runApp(const App());
}
