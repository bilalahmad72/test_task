import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/values/values.dart';

class SettingsItemWidget extends StatelessWidget with AppContextMixin {
  final VoidCallback onTap;
  final String title;

  const SettingsItemWidget({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: c.paddings.h16V12,
          width: c.sizes.width(context),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.neutral200, width: 0.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: c.sizes.fontSize16, color: AppColors.neutral800, fontWeight: FontWeight.w500),
              ),
              SvgPicture.asset(AppIcons.nextArrow),
            ],
          ),
        ),
      ),
    );
  }
}
