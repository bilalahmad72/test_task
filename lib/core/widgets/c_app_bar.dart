import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/values/values.dart';

class CAppBarWidget extends StatelessWidget with AppContextMixin {
  final VoidCallback onTap;
  final String title;

  const CAppBarWidget({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 56 + MediaQuery.paddingOf(context).top,
          width: c.sizes.width(context),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(color: AppColors.black.withAlpha(16), blurRadius: 2, offset: const Offset(0, 1)),
              BoxShadow(color: AppColors.black.withAlpha(18), blurRadius: 8, offset: const Offset(0, 4)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(4, 10, 16, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Material(
                      color: AppColors.transparent,
                      child: InkWell(
                        onTap: onTap,
                        splashColor: AppColors.black.withAlpha(20),
                        borderRadius: BorderRadius.circular(c.sizes.radius50),
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: SvgPicture.asset(AppIcons.backArrow, fit: BoxFit.scaleDown, height: c.sizes.iconSize24),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: c.sizes.fontSize18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
