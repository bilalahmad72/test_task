import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/values/values.dart';

class CustomToast extends StatelessWidget with AppContextMixin {
  final String message;
  final String? iconPath;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const CustomToast({
    super.key,
    required this.message,
    this.iconPath,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: c.paddings.horizontal8,
      padding: c.paddings.h8V6,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(c.sizes.radius50),
        border: Border.all(color: borderColor ?? AppColors.success100, width: 1.0),
        boxShadow: [
          BoxShadow(color: AppColors.black.withAlpha(30), offset: const Offset(0, -4), blurRadius: 8, spreadRadius: 0),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null)
            Container(width: 36, height: 36, padding: c.paddings.all6, child: SvgPicture.asset(iconPath!))
          else
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: const Color(0xFF4CAF50), shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            ),
          SizedBox(width: c.sizes.spacing2),
          Flexible(
            child: Text(
              message,
              style: TextStyle(fontSize: c.sizes.fontSize12, color: textColor ?? AppColors.neutral800),
            ),
          ),
        ],
      ),
    );
  }
}
