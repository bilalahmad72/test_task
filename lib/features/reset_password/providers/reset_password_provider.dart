import 'package:flutter_riverpod/legacy.dart';
import 'package:task_project/core/enums/password_strength.dart';
import 'package:task_project/features/reset_password/providers/state/password_state.dart';

class PasswordNotifier extends StateNotifier<PasswordState> {
  PasswordNotifier() : super(PasswordState());

  void updatePassword(String password) {
    final strength = _calculateStrength(password);
    state = state.copyWith(password: password, strength: strength);
  }

  void toggleObscure() {
    state = state.copyWith(isObscured: !state.isObscured);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  PasswordStrength _calculateStrength(String password) {
    final length = password.length;

    if (length == 0) {
      return PasswordStrength.none;
    } else if (length >= 1 && length <= 3) {
      return PasswordStrength.weak;
    } else if (length >= 4 && length <= 6) {
      return PasswordStrength.medium;
    } else if (length >= 7 && length <= 9) {
      return PasswordStrength.good;
    } else {
      return PasswordStrength.strong;
    }
  }

  void reset() {
    state = PasswordState();
  }
}

final passwordProvider = StateNotifierProvider<PasswordNotifier, PasswordState>((ref) {
  return PasswordNotifier();
});
