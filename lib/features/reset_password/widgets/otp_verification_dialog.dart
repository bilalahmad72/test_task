import 'package:flutter/material.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/values/values.dart';
import 'package:task_project/features/reset_password/widgets/otp_input_box.dart';

class OtpVerificationDialog extends StatefulWidget {
  final Function(String otpCode)? onOtpCompleted;

  const OtpVerificationDialog({super.key, this.onOtpCompleted});

  @override
  State<OtpVerificationDialog> createState() => _OtpVerificationDialogState();
}

class _OtpVerificationDialogState extends State<OtpVerificationDialog> with AppContextMixin {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  String _otpCode = '';
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    debugPrint('🔢 OtpDialog: initState called');
    _controllers = List.generate(6, (index) => TextEditingController());
    _focusNodes = List.generate(6, (index) => FocusNode());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint('🎯 OtpDialog: Requesting focus on first field');
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(int index, String value) {
    setState(() {
      _updateOtpCode();
      _checkCompletion();
    });
  }

  void _updateOtpCode() {
    _otpCode = _controllers.map((controller) => controller.text).join();
  }

  void _checkCompletion() {
    _isComplete = _controllers.every((controller) => controller.text.isNotEmpty);
  }

  void _onOtpCompleted() {
    _updateOtpCode();
    _checkCompletion();

    if (_isComplete) {
      if (widget.onOtpCompleted != null) {
        widget.onOtpCompleted!(_otpCode);
      }
    }
  }

  void _clearOtp() {
    setState(() {
      for (var controller in _controllers) {
        controller.clear();
      }
      _otpCode = '';
      _isComplete = false;
    });
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: c.sizes.width(context),
        padding: c.paddings.h24V36,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(c.sizes.radius20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.weSentAText,
              style: TextStyle(fontSize: c.sizes.fontSize18, color: AppColors.primary700, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: c.sizes.spacing16),

            ///
            Text(
              AppStrings.enterCodeSentTo,
              style: TextStyle(fontSize: c.sizes.fontSize16, fontWeight: FontWeight.w500, color: AppColors.neutral600),
            ),
            SizedBox(height: c.sizes.spacing4),
            Text(
              '+962 77 123 4567',
              style: TextStyle(
                fontSize: c.sizes.fontSize16,
                fontWeight: FontWeight.bold,
                color: AppColors.textActiveTertiary,
              ),
            ),

            ///
            SizedBox(height: c.sizes.spacing30),
            SizedBox(
              height: 74,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    OtpInputBox(
                      index: i,
                      controller: _controllers[i],
                      focusNode: _focusNodes[i],
                      onChanged: (value) => _onDigitChanged(i, value),
                      onCompleted: _onOtpCompleted,
                    ),

                  Container(
                    height: 48,
                    width: 13,
                    margin: EdgeInsets.only(right: c.sizes.spacing6),
                    child: Center(
                      child: Container(
                        height: 3,
                        width: 12,
                        decoration: BoxDecoration(
                          color: AppColors.neutral300,
                          borderRadius: BorderRadius.circular(c.sizes.radius2),
                        ),
                      ),
                    ),
                  ),

                  for (int i = 3; i < 6; i++)
                    OtpInputBox(
                      index: i,
                      controller: _controllers[i],
                      focusNode: _focusNodes[i],
                      onChanged: (value) => _onDigitChanged(i, value),
                      onCompleted: _onOtpCompleted,
                    ),
                ],
              ),
            ),

            ///
            SizedBox(height: c.sizes.spacing24),
            Text(
              '${AppStrings.resendCodeIn} 00:29',
              style: TextStyle(fontSize: c.sizes.fontSize12, color: AppColors.neutral600),
            ),

            ///
            SizedBox(
              height: 56,
              width: c.sizes.width(context),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    _clearOtp();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppStrings.cancel,
                    style: TextStyle(
                      fontSize: c.sizes.fontSize14,
                      color: AppColors.textActiveTertiary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
