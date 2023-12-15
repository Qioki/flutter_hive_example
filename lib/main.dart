import 'package:flutter/material.dart';
import 'package:flutter_hive_example/di/locator.dart';
import 'package:flutter_hive_example/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(MyApp());
}
