import 'package:flutter/material.dart';
import 'package:task_project/core/values/app_colors.dart';

enum PasswordStrength {
  none,
  weak,
  medium,
  good,
  strong;

  Color get color {
    switch (this) {
      case PasswordStrength.none:
        return AppColors.neutral200;
      case PasswordStrength.weak:
        return AppColors.errorDefault;
      case PasswordStrength.medium:
        return AppColors.primaryDefault;
      case PasswordStrength.good:
        return AppColors.warningDefault;
      case PasswordStrength.strong:
        return Colors.green;
    }
  }

  int get filledBars {
    switch (this) {
      case PasswordStrength.none:
        return 0;
      case PasswordStrength.weak:
        return 1;
      case PasswordStrength.medium:
        return 2;
      case PasswordStrength.good:
        return 3;
      case PasswordStrength.strong:
        return 4;
    }
  }

  bool get isValid {
    return this == PasswordStrength.good || this == PasswordStrength.strong;
  }
}
