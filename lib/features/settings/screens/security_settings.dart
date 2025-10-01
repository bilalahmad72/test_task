import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:task_project/core/mixins/app_context.dart';
import 'package:task_project/core/routing/app_router.dart';
import 'package:task_project/core/values/values.dart';
import 'package:task_project/core/widgets/widgets.dart';
import 'package:task_project/features/settings/widgets/settings_item.dart';

class SecuritySettings extends StatelessWidget with AppContextMixin {
  const SecuritySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewWrapper(
      onBackTap: () {},
      appBarTitle: AppStrings.secureSettings,
      child: ListView(
        padding: c.paddings.vertical16,
        children: [
          SettingsItemWidget(
            onTap: () {
              context.push(AppRouter.resetPassword);
            },
            title: AppStrings.resetPassword,
          ),
        ],
      ),
    );
  }
}
