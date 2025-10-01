import 'package:flutter/material.dart';
import 'package:task_project/core/mixins/app_context.dart';

class AppPadding with AppContextMixin {
  AppPadding._();

  static final AppPadding _instance = AppPadding._();

  factory AppPadding() => _instance;

  static AppPadding get instance => _instance;

  /// All padding values
  EdgeInsetsGeometry get all16 => EdgeInsets.all(c.sizes.spacing16);

  EdgeInsetsGeometry get all6 => EdgeInsets.all(c.sizes.spacing6);

  /// Horizontal padding
  EdgeInsetsGeometry get horizontal4 => EdgeInsets.symmetric(horizontal: c.sizes.spacing4);

  EdgeInsetsGeometry get horizontal8 => EdgeInsets.symmetric(horizontal: c.sizes.spacing8);

  EdgeInsetsGeometry get horizontal24 => EdgeInsets.symmetric(horizontal: c.sizes.spacing24);

  /// Vertical padding
  EdgeInsetsGeometry get vertical16 => EdgeInsets.symmetric(vertical: c.sizes.spacing16);

  /// Top padding
  EdgeInsetsGeometry get top4 => EdgeInsets.only(top: c.sizes.spacing4);

  /// Bottom padding
  EdgeInsetsGeometry get bottom4 => EdgeInsets.only(bottom: c.sizes.spacing4);

  /// Left padding
  EdgeInsetsGeometry get left4 => EdgeInsets.only(left: c.sizes.spacing4);

  /// Right padding
  EdgeInsetsGeometry get right6 => EdgeInsets.only(right: c.sizes.spacing6);

  /// symmetric paddings
  EdgeInsetsGeometry get h4V4 => EdgeInsets.symmetric(horizontal: c.sizes.spacing4, vertical: c.sizes.spacing4);

  EdgeInsetsGeometry get h8V6 => EdgeInsets.symmetric(horizontal: c.sizes.spacing8, vertical: c.sizes.spacing6);

  EdgeInsetsGeometry get h16V12 => EdgeInsets.symmetric(horizontal: c.sizes.spacing16, vertical: c.sizes.spacing12);

  EdgeInsetsGeometry get h24V36 => EdgeInsets.symmetric(horizontal: c.sizes.spacing24, vertical: c.sizes.spacing36);

  EdgeInsetsGeometry get h16V6 => EdgeInsets.symmetric(horizontal: c.sizes.spacing16, vertical: c.sizes.spacing6);
}
