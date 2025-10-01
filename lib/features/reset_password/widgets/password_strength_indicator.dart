import 'package:flutter/material.dart';
import 'package:task_project/core/enums/password_strength.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/values/values.dart';

class PasswordStrengthIndicator extends StatelessWidget with AppContextMixin {
  final PasswordStrength strength;

  const PasswordStrengthIndicator({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: c.paddings.h16V6,
      child: Row(
        children: List.generate(4, (index) {
          final isFilled = index < strength.filledBars;
          return Container(
            height: 6,
            width: 20,
            margin: c.paddings.right6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(c.sizes.radius2),
              color: isFilled ? strength.color : AppColors.neutral200,
            ),
          );
        }),
      ),
    );
  }
}
