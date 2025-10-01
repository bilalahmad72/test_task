import 'package:flutter/material.dart';
import 'package:task_project/core/values/app_colors.dart';

enum ButtonState {
  inactive,
  active,
  loading;

  Color get backgroundColor {
    switch (this) {
      case ButtonState.active:
        return AppColors.primaryDefault;
      case ButtonState.inactive:
        return AppColors.primary300;
      case ButtonState.loading:
        return AppColors.primary300;
    }
  }

  Color get textColor {
    switch (this) {
      case ButtonState.active:
        return AppColors.white;
      case ButtonState.inactive:
        return AppColors.white.withAlpha(180);
      case ButtonState.loading:
        return AppColors.white.withAlpha(180);
    }
  }

  List<BoxShadow>? get boxShadow {
    switch (this) {
      case ButtonState.active:
        return [BoxShadow(color: AppColors.black.withAlpha(32), blurRadius: 8, offset: const Offset(0, 2))];
      case ButtonState.inactive:
        return null;
      case ButtonState.loading:
        return null;
    }
  }

  Color get splashColor {
    switch (this) {
      case ButtonState.active:
        return AppColors.white.withAlpha(50);
      case ButtonState.inactive:
        return AppColors.transparent;
      case ButtonState.loading:
        return AppColors.transparent;
    }
  }

  Color get highlightColor {
    switch (this) {
      case ButtonState.active:
        return AppColors.white.withAlpha(50);
      case ButtonState.inactive:
        return AppColors.transparent;
      case ButtonState.loading:
        return AppColors.transparent;
    }
  }

  bool get isClickable {
    return this == ButtonState.active;
  }
}
