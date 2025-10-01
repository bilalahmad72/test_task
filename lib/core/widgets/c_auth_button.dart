import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_project/core/enums/button_state.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/values/values.dart';

class CAuthButton extends StatelessWidget with AppContextMixin {
  final VoidCallback? onTap;
  final ButtonState buttonState;
  final double? height;
  final double? width;

  const CAuthButton({super.key, this.onTap, this.buttonState = ButtonState.active, this.height = 56, this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: buttonState.isClickable ? onTap : null,
        borderRadius: BorderRadius.circular(c.sizes.radius50),
        splashColor: buttonState.splashColor,
        highlightColor: buttonState.highlightColor,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(c.sizes.radius50),
            color: buttonState.backgroundColor,
            boxShadow: buttonState.boxShadow,
          ),
          child: SizedBox(
            height: height,
            width: width ?? c.sizes.width(context),
            child: Center(child: _buildButtonContent()),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (buttonState == ButtonState.loading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: c.sizes.spacing12,
        children: [
          SizedBox(width: 20, height: 20, child: CupertinoActivityIndicator(color: buttonState.textColor, radius: 10)),
          Text(
            AppStrings.updatingYourPassword,
            style: TextStyle(fontSize: c.sizes.fontSize16, color: buttonState.textColor, fontWeight: FontWeight.w600),
          ),
        ],
      );
    }

    return Text(
      AppStrings.save,
      style: TextStyle(fontSize: c.sizes.fontSize16, color: buttonState.textColor, fontWeight: FontWeight.w600),
    );
  }
}
