import 'package:flutter/services.dart';
import 'package:task_project/core/values/values.dart';

class AppConfig {
  static Future<void> setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static Future<void> systemUIOverlay() async {
    SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarDividerColor: AppColors.black,
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }
}
