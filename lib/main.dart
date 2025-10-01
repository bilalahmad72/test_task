import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_project/app/my_app.dart';
import 'package:task_project/core/utilities/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.setPreferredOrientations();
  await AppConfig.systemUIOverlay();
  AppContext.initCurrent();
  runApp(ProviderScope(child: const MyApp()));
}
