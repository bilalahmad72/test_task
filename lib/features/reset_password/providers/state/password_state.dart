import 'package:task_project/core/enums/password_strength.dart';

class PasswordState {
  final String password;
  final bool isObscured;
  final PasswordStrength strength;
  final bool isLoading;

  PasswordState({this.password = '', this.isObscured = true, this.strength = PasswordStrength.none, this.isLoading = false});

  PasswordState copyWith({String? password, bool? isObscured, PasswordStrength? strength, bool? isLoading}) {
    return PasswordState(
      password: password ?? this.password,
      isObscured: isObscured ?? this.isObscured,
      strength: strength ?? this.strength,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
