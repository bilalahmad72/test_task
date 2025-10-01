import 'package:task_project/core/values/app_padding.dart';
import 'package:task_project/core/values/app_sizes.dart';

class AppContext {
  static AppContext? _current;

  static AppContext get current {
    if (_current == null) {
      throw Exception('AppContext has not been initialized');
    }
    return _current!;
  }

  AppContext._();

  static AppContext initCurrent() {
    _current ??= AppContext._();
    return _current!;
  }

  final sizes = AppSizes();
  final paddings = AppPadding();
}
