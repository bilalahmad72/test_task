import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_project/core/enums/button_state.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/utilities/toast_helper.dart';
import 'package:task_project/core/values/values.dart';
import 'package:task_project/core/widgets/widgets.dart';
import 'package:task_project/features/reset_password/providers/reset_password_provider.dart';
import 'package:task_project/features/reset_password/widgets/widgets.dart';

class ResetPasswordScreen extends ConsumerWidget with AppContextMixin {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordState = ref.watch(passwordProvider);

    final buttonState = passwordState.isLoading
        ? ButtonState.loading
        : passwordState.strength.isValid
        ? ButtonState.active
        : ButtonState.inactive;

    return BaseViewWrapper(
      onBackTap: () {
        context.pop();
        ref.read(passwordProvider.notifier).reset();
      },
      appBarTitle: AppStrings.resetPassword,
      child: ListView(
        padding: c.paddings.all16,
        children: [
          Text(
            AppStrings.newPassword,
            style: TextStyle(fontSize: c.sizes.fontSize16, fontWeight: FontWeight.bold, color: AppColors.neutral800),
          ),
          SizedBox(height: c.sizes.spacing12),
          TextFormField(
            obscureText: passwordState.isObscured,
            enabled: !passwordState.isLoading,
            onTapOutside: (val) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {
              if (!passwordState.isLoading) {
                ref.read(passwordProvider.notifier).updatePassword(value);
              }
            },
            style: TextStyle(fontSize: c.sizes.fontSize16, color: AppColors.black, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              contentPadding: c.paddings.h16V12,
              filled: true,
              fillColor: AppColors.neutral50,
              constraints: BoxConstraints(maxHeight: 50),
              suffixIcon: IconButton(
                onPressed: passwordState.isLoading ? null : () => ref.read(passwordProvider.notifier).toggleObscure(),
                icon: SvgPicture.asset(AppIcons.eyeHide),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(c.sizes.radius50),
                borderSide: BorderSide(color: AppColors.neutral50),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(c.sizes.radius50),
                borderSide: BorderSide(color: AppColors.neutral50),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(c.sizes.radius50),
                borderSide: BorderSide(color: AppColors.neutral50),
              ),
            ),
          ),
          PasswordStrengthIndicator(strength: passwordState.strength),

          ///
          SizedBox(height: c.sizes.spacing24),
          CAuthButton(
            buttonState: buttonState,
            onTap: passwordState.isLoading
                ? null
                : () async {
                    final screenContext = context;

                    final result = await showModalBottomSheet<String>(
                      context: context,
                      isDismissible: false,
                      isScrollControlled: true,
                      builder: (dialogContext) {
                        return OtpVerificationDialog(
                          onOtpCompleted: (String otpCode) {
                            Navigator.of(dialogContext).pop(otpCode);
                          },
                        );
                      },
                    );

                    if (result != null && result.isNotEmpty) {
                      ref.read(passwordProvider.notifier).setLoading(true);
                      await Future.delayed(Duration(seconds: 4));
                      ref.read(passwordProvider.notifier).reset();

                      if (screenContext.mounted) {
                        screenContext.pop();
                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (screenContext.mounted) {
                            ToastHelper.showSuccessToast(
                              screenContext,
                              'Password updated successfully.',
                              iconPath: AppIcons.success,
                            );
                          }
                        });
                      }
                    }
                  },
          ),

          ///
          SizedBox(height: c.sizes.spacing8),
          SizedBox(
            height: 56,
            width: c.sizes.width(context),
            child: Center(
              child: TextButton(
                onPressed: () {
                  ref.read(passwordProvider.notifier).reset();
                },
                child: Text(
                  AppStrings.cancel,
                  style: TextStyle(fontSize: c.sizes.fontSize16, color: AppColors.neutral600, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
