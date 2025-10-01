import 'package:flutter/material.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/widgets/c_app_bar.dart';

class BaseViewWrapper extends StatelessWidget with AppContextMixin {
  final VoidCallback onBackTap;
  final String appBarTitle;
  final Widget child;

  const BaseViewWrapper({super.key, required this.onBackTap, required this.appBarTitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      body: SizedBox(
        height: c.sizes.height(context),
        width: c.sizes.width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CAppBarWidget(onTap: onBackTap, title: appBarTitle),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
