import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_project/features/reset_password/screens/reset_password_screen.dart';
import 'package:task_project/features/settings/screens/security_settings.dart';

class AppRouter {
  static const String securitySettings = '/security-settings';
  static const String resetPassword = '/reset-password';

  static final GoRouter router = GoRouter(
    initialLocation: securitySettings,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: securitySettings, name: 'security-settings', builder: (context, state) => const SecuritySettings()),
      GoRoute(path: resetPassword, name: 'reset-password', builder: (context, state) => const ResetPasswordScreen()),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Page not found: ${state.uri.toString()}'))),
  );
}
